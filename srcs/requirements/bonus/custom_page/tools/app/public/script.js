import * as THREE from '/node_modules/three/build/three.module.js';
import { OrbitControls } from '/node_modules/three/examples/jsm/controls/OrbitControls.js';
import { OBJLoader } from '/node_modules/three/examples/jsm/loaders/OBJLoader.js';

let mouse = new THREE.Vector2();
let mouse3D = new THREE.Vector3();
document.addEventListener('mousemove', (event) => {
    mouse.x = (event.clientX / window.innerWidth) * 2 - 1;
    mouse.y = -(event.clientY / window.innerHeight) * 2 + 1;
});

// Scene Setup
const scene = new THREE.Scene();
const camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 0.1, 1000);
const renderer = new THREE.WebGLRenderer();
renderer.setSize(window.innerWidth, window.innerHeight);
document.body.appendChild(renderer.domElement);

const textureLoader = new THREE.TextureLoader();
const catBump = textureLoader.load('./assets/Cat_bump.jpg');
const catDiffuse = textureLoader.load('./assets/Cat_diffuse.jpg');

let cat;

const loader = new OBJLoader();
loader.load(
    './assets/cat.obj',
    function (object) {
        scene.add(object);
        object.position.y -= 2;
        object.position.z -= 0;
        object.rotation.x = -90 * Math.PI / 180;
        console.log('OBJ model loaded!', object);

        object.traverse((child) => {
            if (child.isMesh) {
                child.scale.set(0.1, 0.1, 0.1);
                child.material = new THREE.MeshStandardMaterial({
                    color: 0xffffff,
                    bumpMap: catBump,
                    map: catDiffuse
                });
            }
        });
        cat = object;
    },
    function (xhr) {
        console.log((xhr.loaded / xhr.total * 100) + '% loaded');
    },
    function (error) {
        console.log('An error happened', error);
    }
);

// Add lighting
const ambientLight = new THREE.AmbientLight(0xffffff, 0.5);
scene.add(ambientLight);

const directionalLight = new THREE.DirectionalLight(0xffffff, 1);
directionalLight.position.set(5, 10, 7.5);
scene.add(directionalLight);

camera.position.set(0, 0, 5);

// Set up OrbitControls
const controls = new OrbitControls(camera, renderer.domElement);
controls.update(); // Only needed if the controls.enableDamping = true, or if controls.auto-rotation is enabled

// Animation Loop
function animate() {
    requestAnimationFrame(animate);
    controls.update(); // Update controls every frame
    renderer.render(scene, camera);
    if (cat)
        cat.rotation.z += 0.05;
}

const listener = new THREE.AudioListener();
camera.add(listener);

const sound = new THREE.Audio(listener);
const audioLoader = new THREE.AudioLoader();
audioLoader.load('./assets/sound.mp3', function(buffer) {
    sound.setBuffer(buffer);
    sound.setLoop(true);
    sound.setVolume(1);
});

document.getElementById('playButton').addEventListener('click', () => {
    sound.play();
});

animate();