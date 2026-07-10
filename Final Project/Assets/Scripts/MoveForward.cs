using UnityEngine;

public class MoveForward : MonoBehaviour
{
    public GameObject Player;
    public float speed;
    private SpawnManager spawnManagerScript;
    private PlayerController playerControllerScript;
    private float multiplier;

    // Start is called once before the first execution of Update after the MonoBehaviour is created
    void Start()
    {
        spawnManagerScript = GameObject.Find("Spawn Manager").GetComponent<SpawnManager>();
        playerControllerScript = Player.GetComponent<PlayerController>();
    }

    // Update is called once per frame
    void Update()
    {
        multiplier = Mathf.Pow(spawnManagerScript.animalSpawnRate, (1f / 3f)) * 0.8f;
        playerControllerScript.maxSpeed = (Mathf.Pow(multiplier, (1f / 3f)) * 20f) + 0f;
        transform.Translate(Vector3.forward * Time.deltaTime * speed * multiplier);
        float deltaX = transform.position.x - Player.transform.position.x;
        float deltaZ = transform.position.z - Player.transform.position.z;
        if ((deltaX * deltaX) + (deltaZ * deltaZ) > 8100) {
            Destroy(gameObject);
        }
    }
}
