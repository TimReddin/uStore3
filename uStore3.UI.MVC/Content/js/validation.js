function validateForm(event) {
    console.log("In validation.js");
    //We want to require each field, so we need to access all of the user input.
    let fname = document.forms["main-contact-form"]["fname"].value;
    let lname = document.forms["main-contact-form"]["lname"].value;
    let email = document.forms["main-contact-form"]["email"].value;
    let subject = document.forms["main-contact-form"]["subject"].value;
    let message = document.forms["main-contact-form"]["message"].value;
    console.log("In validation point 2.js");
    //access error message elements
    let msgFName = document.getElementById("msgFName");
    let msgLName = document.getElementById("msgLName");
    let msgEmail = document.getElementById("msgEmail");
    let msgSubject = document.getElementById("msgSubject");
    let msgMessage = document.getElementById("msgMessage");



    //regular expression test email
    let regexEmail = new RegExp(/^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/);

    //USe a regular expression to make sure the name only contains and space (no numbers, no special characters)
    let regexName = new RegExp(/^[a-zA-Z]+(\s[a-zA-Z]+)?$/);

    
    //Test all conditions - if ANY are not met, stopt the form from submitting

    if (fname.length == 0 || lname == 0 || email.length == 0 || subject.length == 0 || message.length == 0 || !regexEmail.test(email)) {
        event.preventDefault();//stops the default action (don't submit the form)

        //Test individual conditions & pront error message
        if (fname.length == 0) {
            msgFName.textContent = "* First name is required";
        } else {
            msgFName.textContent = "";
        }

        if (lname.length == 0) {
            msgLName.textContent = "* Last name is required";
        } else {
            msgLName.textContent = "";
        }

        if (email.length == 0) {
            msgEmail.textContent = "* Email is required";
        } else {
            msgEmail.textContent = "";
        }

        if (subject.length == 0) {
            msgSubject.textContent = "* Subject is required";
        } else {
            msgSubject.textContent = "";
        }

        if (message.length == 0) {
            msgMessage.textContent = "* Message is required";
        } else {
            msgMessage.textContent = "";
        }

        //Regex error message
        if (!regexEmail.test(email) && email.length > 0) {
            msgEmail.textContent = "* Email must have an @ and be followed by a domain -- ex: username@domaim.com";
        }

        if (regexEmail.test(email) && email.length > 0) {
            msgEmail.textContent = "";
        }

        if (!regexName.test(fname) && fname.length > 0) {
            msgFName.textContent = "* Name must contain only letters and spaces";
        }

        if (regexName.test(fname) && fname.length > 0) {
            msgFName.textContent = "";
        }

        if (!regexName.test(lname) && lname.length > 0) {
            msgLName.textContent = "* Name must contain only letters and spaces";
        }

        if (regexName.test(lname) && lname.length > 0) {
            msgLName.textContent = "";
        }
    }//end main if
}//end function