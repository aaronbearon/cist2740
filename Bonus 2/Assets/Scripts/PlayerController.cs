using UnityEngine;
using UnityEngine.InputSystem;

public class PlayerController : MonoBehaviour
{
    public InputAction moveAction;
    public Vector2 moveInput;
    public float speed = 10.0f;
    // Set horizontal bounds at -10 and 10.
    public float xRange = 10.0f;
    // Set vertical bounds.
    private float lowerBound = -2.0f;
    private float topBound = 8.0f;

    public GameObject projectilePrefab;
    public InputAction fireAction;

    // Start is called once before the first execution of Update after the MonoBehaviour is created
    void Start()
    {
        moveAction.Enable();
        fireAction.Enable();
    }

    // Update is called once per frame
    void Update()
    {
        // Keep the player in bounds.
        if (transform.position.x < -xRange)
        {
            transform.position = new Vector3(-xRange, transform.position.y, transform.position.z);
        }

        if (transform.position.x > xRange)
        {
            transform.position = new Vector3(xRange, transform.position.y, transform.position.z);
        }

        if (transform.position.z < lowerBound)
        {
            transform.position = new Vector3(transform.position.x, transform.position.y, lowerBound);
        }

        if (transform.position.z > topBound)
        {
            transform.position = new Vector3(transform.position.x, transform.position.y, topBound);
        }

        moveInput = moveAction.ReadValue<Vector2>();
        transform.Translate(Vector3.right * moveInput.x * Time.deltaTime * speed);
        // Added vertical movement.
        transform.Translate(Vector3.forward * moveInput.y * Time.deltaTime * speed);

        if (fireAction.triggered)
        {
            // Launch a projectile from the player.
            Instantiate(projectilePrefab, transform.position, projectilePrefab.transform.rotation);
        }
    }
}
