import UIKit
import Firebase
import FirebaseAuth



class SignUpViewController: UIViewController {
    
    
    @IBOutlet weak var emailTextField : UITextField!
    @IBOutlet weak var passwordTextField : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction  func signUpUser(_ sender: AnyObject){
        if emailTextField.text ==  ""  || passwordTextField.text ==  ""{
            let alertController = UIAlertController(title: "Error", message: "Please Enter Email and Password", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated:  true , completion:  nil)
            
        }else{
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) {
             (authResult , error) in
                if  error == nil{
                    print("sign up success check firabase console")
                    
                  let vc = self.storyboard?.instantiateViewController(withIdentifier: "loginViewID")
                  self.present(vc!, animated:  true ,completion:  nil)
                    
                }else{
                    
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
            
            
        }
    }
    
    
    
}
