using UnityEngine;
using UnityEngine.SceneManagement;

public class MainMenuController : MonoBehaviour
{
    public void StartGameNormal()
    {
        PlayerController.Frenzy = false;
        SceneManager.LoadScene("Story");
    }

    public void StartGameFrenzy()
    {
        PlayerController.Frenzy = true;
        SceneManager.LoadScene("Story");
    }
}
