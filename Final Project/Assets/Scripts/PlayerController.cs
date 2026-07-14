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
    public ParticleSystem explosionParticle;

    private static readonly Plane groundPlane = new Plane(Vector3.up, Vector3.zero);

    void Start()
    {
        Alive = true;
        playerAnim = GetComponent<Animator>();
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
        transform.position += delta.normalized * speed * Time.deltaTime;

        // animate relative to max speed
        playerAnim.SetFloat("Speed_f", speed / maxSpeed);
    }

    private void OnTriggerEnter(Collider other)
    {
        Debug.Log("Game Over!");
        Alive = false;
        GameObject.Find("Spawn Manager").GetComponent<SpawnManager>().GameOver();
        playerAnim.SetBool("Death_b", true);
        playerAnim.SetInteger("DeathType_int", 1);
        explosionParticle.Play();
    }
}
