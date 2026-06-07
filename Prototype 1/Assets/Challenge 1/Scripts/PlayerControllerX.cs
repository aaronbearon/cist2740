using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class PlayerControllerX : MonoBehaviour
{
    public float speed;
    public float rotationSpeed;
    public float verticalInput;

    // track the current pitch manually to avoid weird float math errors
    public float currentPitch = 0f;

    // Start is called before the first frame update
    void Start()
    {

    }

    // Update is called once per frame
    void FixedUpdate()
    {
        // Get the user's vertical input
        verticalInput = Input.GetAxis("Vertical");

        // Move the plane forward at a constant rate, forward, based on deltaTime.
        transform.Translate(Vector3.forward * Time.deltaTime * speed);

        // Tilt the plane up/down based on up/down arrow keys
        // Multiply by -1 so that up tilts the plane to travel up, down tilts to travel down.
        currentPitch += verticalInput * -1 * rotationSpeed * Time.deltaTime;
        // Don't allow the plane to tilt past straight up or down.
        currentPitch = Mathf.Clamp(currentPitch, -90, 90);
        transform.localRotation = Quaternion.Euler(currentPitch, 0, 0);

        // If we reach the end of the course, go back to the truck game.
        if (transform.position.z > 300)
        {
            SceneManager.LoadScene("Prototype 1");
        }
    }
}
