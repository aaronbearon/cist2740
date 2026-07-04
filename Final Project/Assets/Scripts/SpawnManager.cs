using UnityEngine;

public class SpawnManager : MonoBehaviour
{
    public GameObject GroundPrefab;
    public GameObject Player;
    public const int EXTRAS = 3;

    // Start is called once before the first execution of Update after the MonoBehaviour is created
    void Start()
    {
        for (int i = -EXTRAS; i <= EXTRAS; i++)
        {
            for (int j = -EXTRAS; j <= EXTRAS; j++)
            {
                GameObject tile = Instantiate(GroundPrefab, new Vector3(i, 0, j), GroundPrefab.transform.rotation);
                tile.GetComponent<MoveTiles>().Player = Player;
            }
        }
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
