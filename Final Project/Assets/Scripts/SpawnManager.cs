using UnityEngine;
using System.Collections.Generic;
using System.Collections;
using TMPro;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class SpawnManager : MonoBehaviour
{
    public GameObject Player;
    public GameObject groundPrefab;
    public GameObject[] animalPrefabs;
    public GameObject gameOverScreen;
    public TextMeshProUGUI gameOverText;
    public Button restartButton;
    public Button menuButton;
    public Button exitButton;
    public const int EXTRAS = 3;

    // First, 2 seconds pass before animals start spawning.
    // Second, an animal spawns once every 1/2 seconds.
    // Third, once 5 seconds pass, the reciprocal of animalSpawnRate increases by 0.02 every second.
    private float spawnRateRate = 1f;
    private float spawnRateTimer = 5f;
    public float animalSpawnRate;
    private float animalSpawnTimer = 2f;

    void Start()
    {
        gameOverScreen.gameObject.SetActive(false);
        animalSpawnRate = 2f;
        // Player = GameObject.Find("Player");
        for (int i = -EXTRAS; i <= EXTRAS; i++)
        {
            for (int j = -EXTRAS; j <= EXTRAS; j++)
            {
                GameObject tile = Instantiate(groundPrefab, new Vector3(i, 0, j), groundPrefab.transform.rotation);
                tile.GetComponent<MoveTiles>().Player = Player;
            }
        }
    }

    void Update()
    {
        if (PlayerController.Alive)
        {
            animalSpawnTimer -= Time.deltaTime;
            if (animalSpawnTimer <= 0f)
            {
                SpawnRandomAnimal();
                animalSpawnTimer = 1 / animalSpawnRate;
            }

            spawnRateTimer -= Time.deltaTime;
            if (spawnRateTimer <= 0f)
            {
                animalSpawnRate += 0.02f;
                spawnRateTimer = spawnRateRate;
            }
        }
    }

    void SpawnRandomAnimal()
    {
        // Generate random animal index and spawn position.
        int animalIndex = Random.Range(0, animalPrefabs.Length);

        float unitCircleRotate = Random.Range(0f, 360f);
        float spawnX = -Mathf.Cos(unitCircleRotate * Mathf.PI / 180) * 60;
        float spawnZ = Mathf.Sin(unitCircleRotate * Mathf.PI / 180) * 60;
        float finalRotation = unitCircleRotate + Random.Range(45f, 135f);

        while (!(finalRotation > -180.0f && finalRotation <= 180.0f))
        {
            if (finalRotation <= -180.0f)
            {
                finalRotation += 360;
            }

            if (finalRotation > 180.0f)
            {
                finalRotation -= 360;
            }
        }

        Vector3 spawnPos = new Vector3(spawnX + Player.transform.position.x, 0, spawnZ + Player.transform.position.z);
        GameObject animal = Instantiate(animalPrefabs[animalIndex], spawnPos, Quaternion.Euler(0.0f, finalRotation, 0.0f));
        animal.GetComponent<MoveForward>().Player = Player;
    }

    public void GameOver()
    {
        gameOverScreen.gameObject.SetActive(true);
    }

    public void RestartMode()
    {
        SceneManager.LoadScene("Prototype 2");
    }

    public void MenuTitle()
    {
        SceneManager.LoadScene("Title");
    }

    public void ExitGame()
    {
        Application.Quit();
    }
}
