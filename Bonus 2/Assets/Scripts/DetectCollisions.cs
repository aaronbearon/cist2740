using UnityEngine;

public class DetectCollisions : MonoBehaviour
{
    // Start is called once before the first execution of Update after the MonoBehaviour is created
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    private void OnTriggerEnter(Collider other)
    {
        // Do not feed foxes.
        if (other.CompareTag("Fox"))
        {
            Debug.Log("Fox - Game Over");
        }

        Destroy(gameObject);
        Destroy(other.gameObject);
    }
}
