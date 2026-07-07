using UnityEngine;

public class MoveForward : MonoBehaviour
{
    public GameObject Player;
    public float speed = 20.0f;

    // Start is called once before the first execution of Update after the MonoBehaviour is created
    void Start()
    {

    }

    // Update is called once per frame
    void Update()
    {
        transform.Translate(Vector3.forward * Time.deltaTime * speed);
        float deltaX = transform.position.x - Player.transform.position.x;
        float deltaZ = transform.position.z - Player.transform.position.z;
        if ((deltaX * deltaX) + (deltaZ * deltaZ) > 8100) {
            Destroy(gameObject);
        }
    }
}
