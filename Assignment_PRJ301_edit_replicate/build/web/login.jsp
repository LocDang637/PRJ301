<%-- 
    Document   : login
    Created on : Jan 22, 2024, 8:13:25 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login & Register Form</title>
        <style>
            body {
                margin: 0;
                padding: 0;
                font-family: Arial, sans-serif;
                background-image: url(asset/image/loginshoes.jpg.jpg); /* Replace 'background.jpg' with your image path */
                background-size: cover;
                background-position: center;
                height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .form-container {
                background-color: rgba(255, 255, 255, 0.8); /* Adjust opacity as needed */
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            }

            .form-container h2 {
                text-align: center;
            }

            .form-container form {
                display: flex;
                flex-direction: column;
            }

            .form-container input {
                margin-bottom: 10px;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                font-size: 16px;
            }

            .form-container button {
                padding: 10px;
                border: none;
                border-radius: 5px;
                background-color: #007bff;
                color: #fff;
                font-size: 16px;
                cursor: pointer;
            }

            .form-container button:hover {
                background-color: #0056b3;
            }

            .form-container .login-link {
                text-align: center;
                margin-top: 10px;
            }

            /* Define keyframes for the animation */
            @keyframes slideIn {
                from {
                    transform: translateY(-100%);
                }
                to {
                    transform: translateY(0);
                }
            }

            /* Apply animation to the error message box */
            .error-message {
                position: fixed;
                top: 0;
                left: 38.8%;
                transform: translateX(-50%);
                background-color: #ffcccc;
                padding: 10px 20px;
                border-radius: 5px;
                animation: slideIn 0.5s ease-out forwards;
                /* Adjust z-index as needed */
                z-index: 9999;
            }
        </style>

        <!-- Add a div to display the error message -->


    </head>
    <body>
        <div class="form-container">
            <h2>Welcome to KCouture</h2>
            <form action="MainController" method="POST"> <!-- Replace "#" with your form action -->
                <input type="email" name="username" placeholder="Email" required>
                <input type="password" name="password" placeholder="Password" required>
                <input type="submit" name="action" value="Login" style="padding: 10px; 
                       border: none; border-radius: 5px; background-color: #007bff; color: #fff; font-size: 16px; cursor: pointer;">

            </form>
            <div class="login-link">
                <p>Don't have an account? <a href="#register">Register here</a></p>
            </div>
            <form action="#" method="POST" id="register" style="display: none;">
                <input type="email" name="new_email" placeholder="New Email" required>
                <input type="password" name="new_password" placeholder="New Password" required>
                <input type="submit" name="action" value="Login" style="padding: 10px; 
                       border: none; border-radius: 5px; background-color: #007bff; color: #fff; font-size: 16px; cursor: pointer;">
            </form>
        </div>


    </body>
    <script>
        // JavaScript to toggle between login and registration forms
        const loginLink = document.querySelector('.login-link a');
        const registerForm = document.getElementById('register');

        loginLink.addEventListener('click', function (event) {
            event.preventDefault();
            registerForm.style.display = 'block';
        });
    </script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script>
        var tmp = '${requestScope.invalid_credential}';
        if (${requestScope.invalid_credential != null}) {
            swal({
                title: "Opps!",
                text: '${requestScope.invalid_credential}',
                icon: "error",
                button: "Ok"
            });
        }
        if (${requestScope.invalid_password != null}) {
            swal({
                title: "Opps!",
                text: '${requestScope.invalid_password}',
                icon: "error",
                button: "Ok"
            });
        }
    </script>
    <script>
        var tmp = '${requestScope.Error_id}';
        if (${requestScope.Error_id != null}) {
            swal({
                title: "Opps!",
                text: '${requestScope.Error_id}',
                icon: "error",
                button: "Ok"
            });
        }
        if (${requestScope.Error_password != null}) {
            swal({
                title: "Opps!",
                text: '${requestScope.Error_password}',
                icon: "error",
                button: "Ok"
            });
        }
    </script>

    <script>
        // Get the error message passed from LoginServlet
    var errorMessage = "<%= request.getAttribute("errorMessage")%>";
        // Check if there is a non-null and non-empty error message
        if (errorMessage && errorMessage.trim() !== "" && errorMessage !== "null") {
            // Create a div for the error message
            var errorDiv = document.createElement("div");
            errorDiv.classList.add("error-message");
            // Create a text node with the error message
            var errorMessageNode = document.createTextNode(errorMessage);
            // Append the text node to the div
            errorDiv.appendChild(errorMessageNode);
            // Append the div to the body of the document
            document.body.appendChild(errorDiv);
        }
    </script>
</html>
