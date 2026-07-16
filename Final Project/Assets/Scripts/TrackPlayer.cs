using UnityEngine;

public class TrackPlayer : MonoBehaviour
{
    public GameObject Player;
    public float maxDegressPerSecond = 60f;
    public AudioClip roarSound;

    private AudioSource dinosaurAudio;

    void Start()
    {
        if (gameObject.CompareTag("Dinosaur"))
        {
            dinosaurAudio = GetComponent<AudioSource>();
            dinosaurAudio.PlayOneShot(roarSound);
        }
    }

    void Update()
    {
        Vector3 delta = Player.transform.position - transform.position;
        delta.y = 0f;
        if (delta.sqrMagnitude < 0.0001f)
        {
            return;
        }

        float angle = Vector3.Angle(transform.forward, delta);
        if (angle > 90f)
        {
            return; // we ran past the player
        }

        Quaternion targetRotation = Quaternion.LookRotation(delta);
        transform.rotation = Quaternion.RotateTowards(transform.rotation, targetRotation, maxDegressPerSecond * Time.deltaTime);
    }
}
