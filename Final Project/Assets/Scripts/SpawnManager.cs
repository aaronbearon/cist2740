using UnityEngine;
using System.Collections.Generic;
using System.Collections;
using TMPro;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class SpawnManager : MonoBehaviour
{
    private AudioSource audioSource;
    public AudioClip mainMusic;
    public GameObject Player;
    public GameObject groundPrefab;
    public GameObject[] animalPrefabs;
    public GameObject dinosaurPrefab;
    public GameObject gameOverScreen;
    public TextMeshProUGUI gameOverText;
    public TextMeshProUGUI timeText;
    public TextMeshProUGUI dinosaurText;
    public Button restartButton;
    public Button menuButton;
    public Button exitButton;
    public const int EXTRAS = 3;

    // animalSpawnRate ramps from baseSpawnRate, starting spawnRateRampDelay seconds after
    // level load, increasing by spawnRateRampPerSecond every second after that.
    private const float baseSpawnRate = 2f;
    private const float spawnRateRampDelay = 5f;
    private const float spawnRateRampPerSecond = 0.02f;

    public float animalSpawnRate;

    private float animalSpawnTimer = 2f;
    private float dinosaurSpawnInterval = 30f;
    private float nextDinosaur = 30f;
    private float pitchShift = -2f;
    public float dinosaurSpawnTime = 0;

    public static int dinosaursCleared;

    void Start()
    {
        audioSource = GetComponent<AudioSource>();
        audioSource.clip = mainMusic;
        audioSource.playOnAwake = true;
        audioSource.loop = true;
        audioSource.pitch = Mathf.Pow(2f, pitchShift / 12f);
        audioSource.Play();
        dinosaursCleared = 0;
        gameOverScreen.gameObject.SetActive(false);
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
            animalSpawnRate = baseSpawnRate + spawnRateRampPerSecond * Mathf.Max(0f, Time.timeSinceLevelLoad - spawnRateRampDelay);

            animalSpawnTimer -= Time.deltaTime;
            if (animalSpawnTimer <= 0f)
            {
                SpawnRandomAnimal();
                animalSpawnTimer = 1 / animalSpawnRate;
            }

            dinosaurSpawnTime += Time.deltaTime;
            if (dinosaurSpawnTime >= nextDinosaur)
            {
                SpawnDinosaur();
                nextDinosaur += dinosaurSpawnInterval;
                pitchShift += 1f;
                audioSource.pitch = Mathf.Pow(2f, pitchShift / 12f);
            }

            timeText.text = "Time: " + Mathf.FloorToInt(Time.timeSinceLevelLoad);
            dinosaurText.text = "Dinos: " + dinosaursCleared;
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

    void SpawnDinosaur()
    {
        float unitCircleRotate = Random.Range(0f, 360f);
        float spawnX = -Mathf.Cos(unitCircleRotate * Mathf.PI / 180) * 60;
        float spawnZ = Mathf.Sin(unitCircleRotate * Mathf.PI / 180) * 60;
        float finalRotation = unitCircleRotate + Random.Range(70f, 110f);

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
        GameObject dinosaur = Instantiate(dinosaurPrefab, spawnPos, Quaternion.Euler(0.0f, finalRotation, 0.0f));
        dinosaur.GetComponent<MoveForward>().Player = Player;
        dinosaur.GetComponent<TrackPlayer>().Player = Player;
    }

    public void GameOver()
    {
        audioSource.Stop();
        gameOverScreen.gameObject.SetActive(true);
    }

    public void RestartMode()
    {
        SceneManager.LoadScene("Game");
    }

    public void MenuTitle()
    {
        SceneManager.LoadScene("Title");
    }

    public void ExitGame()
    {
#if UNITY_EDITOR
        UnityEditor.EditorApplication.isPlaying = false;
#else
        Application.Quit();
#endif
    }
}
