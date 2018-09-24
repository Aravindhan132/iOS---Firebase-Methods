 
import UIKit
import Firebase
import FirebaseAuth
import GoogleSignIn


class LoginViewController: UIViewController , GIDSignInUIDelegate {
    
    @IBOutlet weak var emailTextfield : UITextField!
    @IBOutlet weak var passwordTextfield : UITextField!
    
    @IBOutlet weak var signInButton: GIDSignInButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
           GIDSignIn.sharedInstance().uiDelegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
     }
    
    override func viewDidAppear(_ animated: Bool) {
        if   Auth.auth().currentUser?.displayName != nil{
            print("USER" ,Auth.auth().currentUser?.displayName)
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "homeViewID")
            present(vc!, animated:  true ,completion:  nil)
        }
    }
    
    
    @IBAction func loginClick(_ sender: AnyObject)
    {
       if  emailTextfield.text == "" || passwordTextfield.text == "" {
        
            let alertController = UIAlertController(title: "Error", message: "Please Enter Email and Password", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated:  true , completion:  nil)
            
        }else{
        Auth.auth().signIn(withEmail: emailTextfield.text!, password: passwordTextfield.text!){
            (authResult , error ) in
            if  error == nil {
                print("login success")
                
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "homeViewID")
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
    
    
    @IBAction func googleSign(_ sender : AnyObject){
      
       
    }
    
    
    
 
}
