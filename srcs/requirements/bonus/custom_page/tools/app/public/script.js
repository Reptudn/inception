import * as THREE from '/node_modules/three/build/three.module.js';

import { OrbitControls } from '/node_modules/three/examples/jsm/controls/OrbitControls.js';
import { OBJLoader } from '/node_modules/three/examples/jsm/loaders/OBJLoader.js';

// Scene Setup
const scene = new THREE.Scene();
const camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 0.1, 1000);
const renderer = new THREE.WebGLRenderer();
renderer.setSize(window.innerWidth, window.innerHeight);
document.body.appendChild(renderer.domElement);

// Cube
const geometry = new THREE.BoxGeometry();
const material = new THREE.MeshBasicMaterial({ color: 0x00ff00 });
const cube = new THREE.Mesh(geometry, material);
scene.add(cube);

const light = new THREE.AmbientLight(0x404040, 2); // Ambient light
scene.add(light);

// Load the OBJ model
const loader = new OBJLoader();
loader.load(
    './assets/first_n.obj',
    function (object) {
        scene.add(object);
        object.position.x = -10;
        console.log('OBJ model loaded!', object);

        object.traverse((child) => {
            if (child.isMesh) {
                // Change the color of all mesh parts
                child.scale.set(0.025, 0.025, 0.025);
                child.material = new THREE.MeshStandardMaterial({ color: 0xFF5733 }); // RGB Hex for a reddish color
            }
        });

    },
    function (xhr) {
        console.log((xhr.loaded / xhr.total * 100) + '% loaded');
    },
    function (error) {
        console.log('An error happened', error);
    }
);

loader.load(
    './assets/last_n.obj',
    function (object) {
        scene.add(object);
        object.position.x = 1;
        console.log('OBJ model loaded!', object);

        object.traverse((child) => {
            if (child.isMesh) {
                // Change the color of all mesh parts
                child.scale.set(0.025, 0.025, 0.025);
                child.material = new THREE.MeshStandardMaterial({ color: 0xFF5733 }); // RGB Hex for a reddish color
            }
        });
    },
    function (xhr) {
        console.log((xhr.loaded / xhr.total * 100) + '% loaded');
    },
    function (error) {
        console.log('An error happened', error);
    }
);

camera.position.z = 5;

// Set up OrbitControls
const controls = new OrbitControls(camera, renderer.domElement);
controls.update(); // Only needed if the controls.enableDamping = true, or if controls.auto-rotation is enabled

// Animation Loop
function animate() {
    requestAnimationFrame(animate);
    cube.rotation.x += 0.01;
    cube.rotation.y += 0.01;
    controls.update(); // Update controls every frame
    renderer.render(scene, camera);
}
animate();
