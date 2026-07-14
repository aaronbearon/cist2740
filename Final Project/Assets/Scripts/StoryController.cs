using UnityEngine;
using UnityEngine.SceneManagement;

public class StoryController : MonoBehaviour
{
    // Start is called once before the first execution of Update after the MonoBehaviour is created
    public void StartGame()
    {
        SceneManager.LoadScene("Game");
    }
}
