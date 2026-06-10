using UnityEngine;
using UnityEngine.InputSystem;

public class SpawnManager : MonoBehaviour
{
    public GameObject[] animalPrefabs;
    public InputAction spawnAction;

    // Spawn coordinates
    private float spawnRangeX = 10;
    private float spawnPosZ = 20;

    private float startDelay = 2.2f;
    // Spawn an animal every 1.2 to 2 seconds.
    private float spawnIntervalMin = 1.2f;
    private float spawnIntervalMax = 2.0f;
    // Control the amount of time before the next animal spawns.
    private float nextSpawnTime = 0f;

    // Start is called once before the first execution of Update after the MonoBehaviour is created
    void Start()
    {
        nextSpawnTime = Time.time + startDelay;
    }

    // Update is called once per frame
    void Update()
    {
        // Then, spawn another animal after a random amount of time between 1.2 and 2 seconds.
        if (Time.time >= nextSpawnTime)
        {
            SpawnRandomAnimal();
            nextSpawnTime = Time.time + Random.Range(spawnIntervalMin, spawnIntervalMax);
        }
    }

    void SpawnRandomAnimal()
    {
        // Generate random animal index and spawn position.
        int animalIndex = Random.Range(0, animalPrefabs.Length);
        Vector3 spawnPos = new Vector3(Random.Range(-spawnRangeX, spawnRangeX), 0, spawnPosZ);

        // Instantiate animal at random spawn location.
        Instantiate(animalPrefabs[animalIndex], spawnPos, animalPrefabs[animalIndex].transform.rotation);
    }
}
