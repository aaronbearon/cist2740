using UnityEngine;

public class SpawnManagerX : MonoBehaviour
{
    public GameObject[] ballPrefabs;

    private float spawnLimitXLeft = -22;
    private float spawnLimitXRight = 7;
    private float spawnPosY = 30;

    private float startDelay = 1.0f;
    private float spawnIntervalMin = 3.0f;
    private float spawnIntervalMax = 5.0f;
    private float nextDropTime = 0f;


    // Start is called before the first frame update
    void Start()
    {
        nextDropTime = Time.time + startDelay;
    }

    // Update is called once per frame
    void Update()
    {
        if (Time.time > nextDropTime)
        {
            nextDropTime = Time.time + Random.Range(spawnIntervalMin, spawnIntervalMax);
            SpawnRandomBall();
        }
    }

    // Spawn random ball at random x position at top of play area
    void SpawnRandomBall ()
    {
        // Generate random ball index and random spawn position
        int ballIndex = Random.Range(0, ballPrefabs.Length);
        Vector3 spawnPos = new Vector3(Random.Range(spawnLimitXLeft, spawnLimitXRight), spawnPosY, 0);

        // instantiate ball at random spawn location
        Instantiate(ballPrefabs[ballIndex], spawnPos, ballPrefabs[0].transform.rotation);
    }
}
