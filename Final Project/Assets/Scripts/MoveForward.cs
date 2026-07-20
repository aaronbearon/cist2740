using UnityEngine;

public class MoveForward : MonoBehaviour
{
    public GameObject Player;
    public float speed;

    void Update()
    {
        float multiplier = Mathf.Pow(1f + 0.02f * Time.timeSinceLevelLoad, 1f / 3f);
        transform.Translate(Vector3.forward * Time.deltaTime * speed * multiplier * 0.95f);
        float deltaX = transform.position.x - Player.transform.position.x;
        float deltaZ = transform.position.z - Player.transform.position.z;
        if ((deltaX * deltaX) + (deltaZ * deltaZ) > 8100)
        {
            if (gameObject.CompareTag("Dinosaur"))
            {
                SpawnManager.dinosaursCleared += 1;
            }
            Destroy(gameObject);
        }
    }
}
