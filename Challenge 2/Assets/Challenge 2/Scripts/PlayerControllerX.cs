using UnityEngine;

public class PlayerControllerX : MonoBehaviour
{
    public GameObject dogPrefab;

    private float fireRate = 0.5f;
    private float nextFireTime = 0f;

    // Start is called once before the first execution of Update after the MonoBehaviour is created
    void Start()
    {

    }

    // Update is called once per frame
    void Update()
    {
        // On spacebar press, send dog
        if (Input.GetKeyDown(KeyCode.Space) && Time.time >= nextFireTime)
        {
            Instantiate(dogPrefab, transform.position, dogPrefab.transform.rotation);
            nextFireTime = Time.time + fireRate;
        }
    }
}
