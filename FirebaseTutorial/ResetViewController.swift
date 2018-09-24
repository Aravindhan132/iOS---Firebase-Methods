 
import UIKit
import Firebase
import FirebaseAuth

class ResetViewController: UIViewController {
    
    @IBOutlet weak var emailTextField  : UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func resetPassFunc(_ sender : AnyObject){
        
        if emailTextField.text == "" {
            let alertController = UIAlertController(title: "Error", message: "Please Enter Email", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(alertAction)
            present(alertController , animated: true, completion:  nil)
        }else{
            Auth.auth().sendPasswordReset(withEmail: emailTextField.text!) {
                error in
                if  error != nil {
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    let alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    
                    alertController.addAction(alertAction)
                    self.present(alertController , animated: true, completion:  nil)
                }
            }
        }
    }
    

    
}
