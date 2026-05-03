<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Netflix Login Page | CodingNepal</title>
    <link rel="stylesheet" href="style.css" />
  </head>
  <body>
    <nav>
      <a href="#"><img src="https://github.com/CanisCoder/jenkins-java-project/blob/master/src/netflixlogo.png?raw=true" alt="logo" /></a>
    </nav>
    <div class="background-image"></div>
    <div class="form-wrapper">
      <h2>NETFLIX SIGN IN V-2.0</h2>
      
      <form onsubmit="handleLogin(event)">
        <div class="form-control">
          <input type="text" id="email" required />
          <label>Email or Mobile number</label>
        </div>
        <div class="form-control">
          <input type="password" id="password" required />
          <label>Password</label>
        </div>
        <button type="submit">WELCOME TO NETFLIX V-2.0</button>
        <div class="form-help">
          <div class="remember-me">
            <input type="checkbox" id="remember-me" />
            <label for="remember-me">Remember me</label>
          </div>
          <a href="#">Need help?</a>
        </div>
      </form>
      
      <p>New to Netflix? <a href="#">Lets join up now</a></p>
      <small>
        This page is protected by Google reCAPTCHA to ensure you're not a bot.
        <a href="#">Learn more.</a>
      </small>
    </div>

    <script>
      async function handleLogin(event) {
          // Prevent the default form submission (page reload)
          event.preventDefault();
          
          // Grab the values from the input fields
          const email = document.getElementById('email').value;
          const password = document.getElementById('password').value;

          try {
              // Send the data to your Node.js backend running in the Docker container
              const response = await fetch('http://3.6.36.34:5000/api/login', {
                  method: 'POST',
                  headers: { 'Content-Type': 'application/json' },
                  body: JSON.stringify({ email, password })
              });

              const result = await response.json();
              
              if (result.success) {
                  // If login is successful, redirect to the new Home Page
                  window.location.href = 'home.html';
              } else {
                  // If login fails, show an alert
                  alert('Authentication failed: ' + result.message);
              }
          } catch (error) {
              console.error('Error:', error);
              alert('Could not connect to the server. Is your backend running?');
          }
      }
    </script>
  </body>
</html>
