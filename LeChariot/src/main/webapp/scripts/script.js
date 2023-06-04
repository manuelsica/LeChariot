const container = document.querySelector(".container"),
    pwshowHide = document.querySelectorAll(".showHidePW"),
    pwFields = document.querySelectorAll(".password"),
    signUp = document.querySelector(".signup-link"),
    login = document.querySelector(".login-link");

/*---------------------------------------------
    
    Hide/UnHide Occhio password
                                
---------------------------------------------*/

pwshowHide.forEach(eyeIcon => {
    eyeIcon.addEventListener("click", () => {
        pwFields.forEach(pwField => {
            if (pwField.type === "password") {

                pwField.type = "text";

                pwshowHide.forEach(icon => {

                    icon.classList.replace("uil-eye-slash", "uil-eye");

                })
            } else {

                pwField.type = "password";

                pwshowHide.forEach(icon => {

                    icon.classList.replace("uil-eye", "uil-eye-slash");

                })
            }
        })

    })
})

/*---------------------------------------------
  
  Effetto click on link 
                              
---------------------------------------------*/
signUp.addEventListener("click", () => {

    container.classList.add("active");

});
login.addEventListener("click", () => {

    container.classList.remove("active");
});




