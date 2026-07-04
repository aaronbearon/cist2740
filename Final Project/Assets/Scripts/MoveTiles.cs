using UnityEngine;

public class MoveTiles : MonoBehaviour
{
    public GameObject Player;
    private const float SIZE = 50.0f; // tile size
    private const float THRESH = 4.5f; // when to relocate tiles
    private const float SNAPDIST = SIZE * THRESH;
    private const int TILES = SpawnManager.EXTRAS * 2 + 1;
    private const float TRANSLATE = SIZE * TILES;

    // Start is called once before the first execution of Update after the MonoBehaviour is created
    void Start()
    {
        transform.position = new Vector3(transform.position.x * SIZE, 0, transform.position.z * SIZE);
    }

    // Update is called once per frame
    void Update()
    {
        if (transform.position.x + SNAPDIST < Player.transform.position.x)
        {
            transform.Translate(TRANSLATE, 0, 0);
        }

        if (transform.position.x - SNAPDIST > Player.transform.position.x)
        {
            transform.Translate(-TRANSLATE, 0, 0);
        }

        if (transform.position.z + SNAPDIST < Player.transform.position.z)
        {
            transform.Translate(0, 0, TRANSLATE);
        }

        if (transform.position.z - SNAPDIST > Player.transform.position.z)
        {
            transform.Translate(0, 0, -TRANSLATE);
        }
    }
}
