using UnityEngine;

public class SpawnManager : MonoBehaviour
{
    public GameObject Player;
    public GameObject groundPrefab;
    public GameObject[] animalPrefabs;
    public const int EXTRAS = 3;

    // Spawn an animal every 0.1 seconds.
    // TODO: increase spawn rate over time?
    private float startDelay = 2;
    private float spawnInterval = 0.1f;

    void Start()
    {
        // Player = GameObject.Find("Player");
        for (int i = -EXTRAS; i <= EXTRAS; i++)
        {
            for (int j = -EXTRAS; j <= EXTRAS; j++)
            {
                GameObject tile = Instantiate(groundPrefab, new Vector3(i, 0, j), groundPrefab.transform.rotation);
                tile.GetComponent<MoveTiles>().Player = Player;
            }
        }

        InvokeRepeating("SpawnRandomAnimal", startDelay, spawnInterval);
    }

    void Update()
    {

    }

    void SpawnRandomAnimal()
    {
        // Generate random animal index and spawn position.
        int animalIndex = Random.Range(0, animalPrefabs.Length);

        float edge = 60.0f;
        float spawnOffset = Random.Range(-edge, edge);
        float finalX = 0.0f;
        float finalZ = 0.0f;
        float rotation = 0.0f;
        float rotateIncrement = 45.0f;
        int randomSide = Random.Range(0, 4);
        if (randomSide < 1)
        {
            finalX = -spawnOffset;
            finalZ = -edge;
            rotation = (finalX * rotateIncrement / edge) + Random.Range(-rotateIncrement, rotateIncrement);
        }
        else if (randomSide < 2)
        {
            finalX = -edge;
            finalZ = spawnOffset;
            rotation = (finalZ * rotateIncrement / edge) + Random.Range(-rotateIncrement, rotateIncrement) + 90;
        }
        else if (randomSide < 3)
        {
            finalX = spawnOffset;
            finalZ = edge;
            rotation = (finalX * rotateIncrement / edge) + Random.Range(-rotateIncrement, rotateIncrement) + 180;
        }
        else if (randomSide < 4)
        {
            finalX = edge;
            finalZ = -spawnOffset;
            rotation = (finalZ * rotateIncrement / edge) + Random.Range(-rotateIncrement, rotateIncrement) + 270;
        }
        else
        {
            Debug.Log("Error, shouldn't get here!");
        }

        while (!(rotation > -180.0f && rotation <= 180.0f))
        {
            if (rotation <= -180.0f)
            {
                rotation += 360;
            }

            if (rotation > 180.0f)
            {
                rotation -= 360;
            }
        }

        Vector3 spawnPos = new Vector3(finalX + Player.transform.position.x, 0, finalZ + Player.transform.position.z);
        GameObject animal = Instantiate(animalPrefabs[animalIndex], spawnPos, Quaternion.Euler(0.0f, rotation, 0.0f));
        animal.GetComponent<MoveForward>().Player = Player;
    }
}
