using UnityEngine;

public class PlayerController : MonoBehaviour
{
    public float maxSpeed = 20f;
    // The mouse must be this far away (world units) to reach maxSpeed.
    private float fullSpeedDistance = 5f;
    // In this distance the player stops so they don't jitter in place.
    private float stopDistance = 0.2f;

    private bool alive;

    private Animator playerAnim;

    private static readonly Plane groundPlane = new Plane(Vector3.up, Vector3.zero);

    void Start()
    {
        alive = true;
        playerAnim = GetComponent<Animator>();
    }

    void Update()
    {
        if (Input.GetMouseButton(0) && alive)
        {
            Vector3 target = GetMouseWorldPosition();
            MoveToward(target);
        }
        else
        {
            // animate relative to max speed
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

        float dist = delta.magnitude;
        if (dist < stopDistance) return;

        transform.rotation = Quaternion.LookRotation(delta);

        float speed = Mathf.Clamp(dist / fullSpeedDistance * maxSpeed, 0f, maxSpeed);
        transform.position += delta.normalized * speed * Time.deltaTime;

        // animate relative to max speed
        playerAnim.SetFloat("Speed_f", speed / maxSpeed);
    }

    private void OnTriggerEnter(Collider other)
    {
        Debug.Log("Game Over!");
        alive = false;
    }
}
