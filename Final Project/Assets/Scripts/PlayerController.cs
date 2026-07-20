using UnityEngine;

public class PlayerController : MonoBehaviour
{
    public static bool Frenzy = false;
    public static bool Alive;

    public float maxSpeed;
    // The mouse must be this far away (world units) to reach maxSpeed.
    private float fullSpeedDistance = 5f;
    // In this distance the player stops so they don't jitter in place.
    private float stopDistance = 0.2f;

    private Animator playerAnim;
    private AudioSource playerAudio;
    public ParticleSystem explosionParticle;
    public AudioClip crashSound;
    public AudioClip gameOverSound;
    public SpawnManager spawnManager;

    private static readonly Plane groundPlane = new Plane(Vector3.up, Vector3.zero);

    void Start()
    {
        Alive = true;
        playerAnim = GetComponent<Animator>();
        playerAudio = GetComponent<AudioSource>();
    }

    void Update()
    {
        if (Alive)
        {
            Vector3 target = GetMouseWorldPosition();
            MoveToward(target);
        }
        else
        {
            // No animation on death
            playerAnim.SetFloat("Speed_f", 0);
        }
    }

    private Vector3 GetMouseWorldPosition()
    {
        Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
        groundPlane.Raycast(ray, out float dist);
        return ray.GetPoint(dist);
    }

    private void MoveToward(Vector3 target)
    {
        Vector3 delta = target - transform.position;
        delta.y = 0f;

        transform.rotation = Quaternion.LookRotation(delta);

        float speed;
        if (Frenzy)
        {
            speed = maxSpeed;
        }
        else
        {
            float dist = delta.magnitude;
            if (dist < stopDistance)
            {
                speed = 0;
            }
            else
            {
                speed = Mathf.Clamp(dist / fullSpeedDistance * maxSpeed, 0f, maxSpeed);
            }
        }

        float multiplier = Mathf.Pow(1f + 0.02f * Time.timeSinceLevelLoad, 1f / 3f);
        transform.position += delta.normalized * speed * Time.deltaTime * multiplier * 0.95f;

        // animate relative to max speed
        playerAnim.SetFloat("Speed_f", speed / maxSpeed);
    }

    private void OnTriggerEnter(Collider other)
    {
        if (Alive)
        {
            Debug.Log("Game Over!");
            Alive = false;
            spawnManager.GameOver();
            playerAnim.SetBool("Death_b", true);
            playerAnim.SetInteger("DeathType_int", 1);
            explosionParticle.Play();
            playerAudio.Stop();
            playerAudio.loop = false;
            playerAudio.pitch = 1f;
            playerAudio.PlayOneShot(crashSound, 1.0f);
            playerAudio.PlayOneShot(gameOverSound, 1.0f);
        }
    }
}
