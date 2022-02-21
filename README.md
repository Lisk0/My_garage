<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

### Built With [Flutter](https://flutter.dev//)


Project that shows the garage with user vehicles. You have option to remove and add vehicles.



Application consists of three screens: 
* Splash screen with metainformation
* Garage screen which shows a grid view of all the vehicles with a button to add vehicle
* Vehicle screen which shows details about a specific vehicle




Application tested on: P30 Pro, Pixel 2 and Pixel 3 android devices.


![Screenshot](/screenshot.jpg?raw=true "Pixel 2")

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- GETTING STARTED -->
## Getting Started

### Prerequisites


* flutter
  ```sh
  git clone https://github.com/flutter/flutter.git -b stable
  export PATH="$PATH:`pwd`/flutter/bin"
  ```


* android studio (for running on android simulator):
  1. Unpack the ```.zip``` file you downloaded to an appropriate location for your applications, such as within ```/usr/local/``` 
  If you're using a 64-bit version of Linux, make sure you first install the required libraries for 64-bit machines
  ```
  sudo apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386
  ```
  2. To launch Android Studio, open a terminal, navigate to the ```android-studio/bin/``` directory, and execute ```studio.sh```
  
  3. Select whether you want to import previous Android Studio settings or not, then click OK.
  
  4. ```The Android Studio Setup Wizard``` guides you through the rest of the setup, which includes downloading Android SDK components that are required for development.

### Installation

1. Clone the repo
   ```sh
   git clone https://github.com/lisk0/My_garage.git
   ```
2. Install packages
   ```sh
   flutter pub get
   ```
3. Check which device is available and run app
   ```js
   flutter devices
   flutter run
   ```

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- LICENSE -->
## License

Distributed under the MIT License.

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- CONTACT -->
## Contact

Nemanja Lisinac - [@linkedin](https://www.linkedin.com/in/nemanja-lisinac-a830a8217/) - nemanjalisinac@gmail.com

Project Link: [https://github.com/lisk0/My_garage](https://github.com/lisk0/My_garage)



<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* [IconMafia](https://iconscout.com/contributors/icon-mafia/icons) - Car brand logos were adjusted for mobile view from his free pack 

<p align="right">(<a href="#top">back to top</a>)</p>
