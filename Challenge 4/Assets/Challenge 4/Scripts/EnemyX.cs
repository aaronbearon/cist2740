using UnityEngine;

public class EnemyX : MonoBehaviour
{
    public float speed = 0.0f;
    private Rigidbody enemyRb;
    private GameObject playerGoal;
    private GameObject player;
    private PlayerControllerX playerControllerScript;

    private float timer = 0.1f;
    private bool timerOn = false;

    // Start is called before the first frame update
    void Start()
    {
        enemyRb = GetComponent<Rigidbody>();
        playerGoal = GameObject.Find("Player Goal");
        player = GameObject.Find("Player");
        playerControllerScript = player.GetComponent<PlayerControllerX>();
    }

    // Update is called once per frame
    void Update()
    {
        // Set enemy direction towards player goal and move there
        Vector3 lookDirection = (playerGoal.transform.position - transform.position).normalized;
        enemyRb.AddForce(lookDirection * speed * Time.deltaTime);
        if (transform.position.y < -50)
        {
            Destroy(gameObject);
        }

        if (!playerControllerScript.alive)
        {
            enemyRb.AddForce(Vector3.up * 1000);
            if (!timerOn)
            {
                timerOn = true;
            }
        }

        if (timerOn)
        {
            timer -= Time.deltaTime;
            if (timer <= 0)
            {
                timer = 0.1f;
                timerOn = false;
                playerControllerScript.alive = true;
            }
        }
    }

    private void OnCollisionEnter(Collision other)
    {
        // If enemy collides with either goal, destroy it
        if (other.gameObject.name == "Enemy Goal")
        {
            // Destroy(gameObject);
        } 
        else if (other.gameObject.name == "Player Goal")
        {
            // Destroy(gameObject);
        }
    }
}
