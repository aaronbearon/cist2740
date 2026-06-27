using UnityEngine;

public class RotateCamera : MonoBehaviour
{
    public float rotationSpeed = 150f;
    private InputSystem_Actions controls;

    // Awake runs once when the script instance is created.
    void Awake()
    {
        controls = new InputSystem_Actions();
    }

    // Enable the Player Action map.
    private void OnEnable()
    {
        controls.Player.Enable();
        Debug.Log(controls.Player.Move);
    }

    // Update is called once per frame.
    private void Update()
    {
        Vector2 moveInput = controls.Player.Move.ReadValue<Vector2>();
        float horizontalInput = moveInput.x; // Left/Right (A/D or arrow keys)
        transform.Rotate(Vector3.up * horizontalInput * rotationSpeed * Time.deltaTime);
    }
}
