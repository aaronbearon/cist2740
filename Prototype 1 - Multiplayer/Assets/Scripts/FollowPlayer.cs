using UnityEngine;

public class FollowPlayer : MonoBehaviour
{
    public GameObject player;
    private Vector3 offset = new Vector3(0, 5, -7);

    // Start is called once before the first execution of Update after the MonoBehaviour is created
    void Start()
    {

    }

    // Update is called once per frame
    void LateUpdate()
    {
        // transform.position = player.transform.position + offset;

        // 1. Calculate the position (the "swing" we just built)
        Quaternion playerRotation = player.transform.rotation;
        Vector3 rotatedOffset = playerRotation * offset;
        transform.position = player.transform.position + rotatedOffset;

        // 2. Set the rotation
        // We want the camera to match the truck's Y rotation (heading)
        // PLUS that 16-degree tilt down on the X axis.
        transform.rotation = playerRotation * Quaternion.Euler(16, 0, 0);
    }
}
