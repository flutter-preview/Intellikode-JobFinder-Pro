'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"index.html": "c7b67b44297cccad4f09cde7b770edd2",
"/": "c7b67b44297cccad4f09cde7b770edd2",
"flutter.js": "6fef97aeca90b426343ba6c5c9dc5d4a",
"version.json": "b585aee8f7832098a0476d9473bcf573",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"assets/fonts/MaterialIcons-Regular.otf": "6a419cf5130e5bfada92046bd41c60ab",
"assets/NOTICES": "9c0b7a2d7b96711e4615878bafca3d92",
"assets/assets/fonts/Quicksand-SemiBold.ttf": "60683c595c4de500713906b9ccf1e2ab",
"assets/assets/fonts/Quicksand-Regular.ttf": "257af36bca67182536b820f9ff273b5a",
"assets/assets/fonts/Poppins-Light.ttf": "1bb10326b972c92be6c59c048a4327e4",
"assets/assets/fonts/Poppins-Regular.ttf": "cd6b896a19b4babd1a2fa07498e9fc47",
"assets/assets/fonts/Poppins-Medium.ttf": "614a91afc751f09d049231f828801c20",
"assets/assets/fonts/Quicksand-Light.ttf": "ff9b23c88a7f18ed1a2e3073d01cee62",
"assets/assets/fonts/Poppins-Bold.ttf": "124cd57d8f41f6db22a724f882dca3f4",
"assets/assets/fonts/Quicksand-Medium.ttf": "890d9ed927bb7f0c6b9eed04f9c329e5",
"assets/assets/fonts/Caros-Medium.otf": "0f9e62140e2c6faad7ac001ed9bdcbce",
"assets/assets/fonts/Caros-Bold.otf": "e6ff9a2c6530276522d4eb4868ed4197",
"assets/assets/fonts/Quicksand-Bold.ttf": "72bbd75830a34c7753f469032209fe1d",
"assets/assets/fonts/Caros.otf": "427ad353f39abf0124242c7431d3b8e4",
"assets/assets/fonts/Caros-Light.otf": "7235a07b741405b836b33fae6e3738bd",
"assets/assets/fonts/Montserrat-Bold.ttf": "1f023b349af1d79a72740f4cc881a310",
"assets/assets/fonts/Poppins-SemiBold.ttf": "0fc985df77c6b59d37e79b97ed7fb744",
"assets/assets/images/image1.png": "e615aebd5348396f9b12fc9defef35ae",
"assets/assets/images/image2.png": "c3fa4156d4ecddfd22037cb5ab34e435",
"assets/assets/svg/document-code-bold.svg": "1ce0df5d5baa4495d69f77bb86790a22",
"assets/assets/svg/people-light.svg": "9dbfe2265b97e102043f247a25ec5eda",
"assets/assets/svg/file-pdf-bold.svg": "b20b55619a5f94b6cbd1ce8edd7afad1",
"assets/assets/svg/calendar-tick-light.svg": "f9a4307d91ea5ca215d58088c89ee14e",
"assets/assets/svg/document-upload-bold.svg": "ecec85141c2c0e5f0e9f29ee9de950cb",
"assets/assets/svg/cpu-charge-bold.svg": "68cf933951765f01274b9cc4de01080c",
"assets/assets/svg/setting-bold.svg": "3edc1de54172b6e727bec0c3cd023dca",
"assets/assets/svg/award-bold.svg": "03c046d4d924c1b54b2989b8b2b8f87d",
"assets/assets/svg/activity-light.svg": "17bf11d6e5438ae435fe3c4079391cbe",
"assets/assets/svg/bezier-bold.svg": "b9836ca848251535f81d6415689560f7",
"assets/assets/svg/location-bold.svg": "7eeceb149135f4ebe0e3ebd8d28784d1",
"assets/assets/svg/arrow-up-broken.svg": "0821e12efe0b7aed10bf0dc745be1a68",
"assets/assets/svg/briefcase-light.svg": "2314e7f273c0b1f04a0c76bcca64287d",
"assets/assets/svg/main-component-bold.svg": "72235d292b0b3f3e7763c1d80a0ed367",
"assets/assets/svg/link-circle-bold.svg": "a644fc46a87b74533872a7be2832b12f",
"assets/assets/svg/trend-up-light.svg": "3e6501e2ef68c3c85cd68e6faf516e63",
"assets/assets/svg/arrow-up-light.svg": "725924bc7cf3956942e9c3512e97fd75",
"assets/assets/svg/twitter-bold.svg": "0eef50479787d446b9ca754dd8be5768",
"assets/assets/svg/brush-bold.svg": "3a9cc38bd50c676c103303ddde7ec5d7",
"assets/assets/svg/arrow-down-light.svg": "7af5c7cbe4e4e55ec5ea8e8f7036457e",
"assets/assets/svg/calendar-edit-light.svg": "48803e42618f8854e0b088f224201b02",
"assets/assets/svg/at-sign-bold.svg": "8bb9406e3fad04b6555fecdd1b70044a",
"assets/assets/svg/eye-slash-bold.svg": "3ba53df20537131d8d156aa1f48d9a70",
"assets/assets/svg/dollar-light.svg": "dbf73111ee2edc001cb39bc0d3f34d11",
"assets/assets/svg/scroll-bold.svg": "963116e1f75239e2a00e282755c856cf",
"assets/assets/svg/lock-bold.svg": "1c9654b825d975ac063afb29d2c2dbab",
"assets/assets/svg/location-light.svg": "4047502fbdfb13f994006a0193addc0f",
"assets/assets/svg/mail-light.svg": "edc06eb7bd3ba6b14f049ac10efcc665",
"assets/assets/svg/user-bold.svg": "2882fa249deb4d7575fe386e768ed877",
"assets/assets/svg/document-text-bold.svg": "4d596d92715d2b3eb94f45dc831026b8",
"assets/assets/svg/arrow-down-broken.svg": "7f74e39e4d3d0f36b81dfb66b341103b",
"assets/assets/svg/code-circle-bold.svg": "d80bb55dabde8eba85bb0246fe348cbb",
"assets/assets/svg/command-bold.svg": "f53075ab2368ae5dcba87e48c193e09f",
"assets/assets/svg/dollar-bold.svg": "de92c6d66206563374f35f18e7b1a1c5",
"assets/assets/svg/verify-bold.svg": "35928ca65a68bb5b8682d8aadc0aa332",
"assets/assets/svg/chart-network-bold.svg": "6fc0af4441558c6ca8ff35eb5d2c7edb",
"assets/assets/svg/add-broken.svg": "e549434ea98483bc73141619a4ff65a9",
"assets/assets/svg/facebook-bold.svg": "82a8555bd40ae03eead5d535d730efad",
"assets/assets/svg/microscope-bold.svg": "c72fc0a1cb3c58054fe87176603c7f0e",
"assets/assets/svg/flash-bold.svg": "819021b3f7d28c6c7dae99b6a6b001a6",
"assets/assets/svg/linkedin-bold.svg": "e42393adb2e2677aeed23f4769080743",
"assets/assets/svg/briefcase-bold.svg": "ec75a4ba54b9a982e543ef4bac098dd0",
"assets/assets/svg/link-circle-light.svg": "d730ba2310d0ea1e92f56addd21e6903",
"assets/assets/svg/eye-bold.svg": "af09965ee5b9891c033636f1b670deca",
"assets/assets/svg/status-up-bold.svg": "daba6d80034db4d93f43ed1cee111e6a",
"assets/assets/lottie/done-success.zip": "b26295c42cb9bb122821161414770325",
"assets/FontManifest.json": "21c80bd7bf162330979616a69706f14b",
"assets/AssetManifest.bin": "31c3024beffc726694c1e202922d3b6c",
"assets/AssetManifest.json": "47d8844ca5aa595dc82fdef0f6d73632",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "57d849d738900cfd590e9adc7e208250",
"assets/packages/iconly/fonts/IconlyLight.ttf": "f840f953f78d9524c49440f125db6b95",
"assets/packages/iconly/fonts/IconlyBold.ttf": "fca99ed4cf1041c3d47ee5e1dd2c2840",
"assets/packages/iconly/fonts/IconlyBroken.ttf": "080943ecb9d811c82177565ba07a453d",
"main.dart.js": "148c3c7cde1e93a5e009cc61667e2ea1",
"canvaskit/skwasm.worker.js": "19659053a277272607529ef87acf9d8a",
"canvaskit/canvaskit.js": "76f7d822f42397160c5dfc69cbc9b2de",
"canvaskit/canvaskit.wasm": "f48eaf57cada79163ec6dec7929486ea",
"canvaskit/skwasm.js": "1df4d741f441fa1a4d10530ced463ef8",
"canvaskit/chromium/canvaskit.js": "8c8392ce4a4364cbb240aa09b5652e05",
"canvaskit/chromium/canvaskit.wasm": "fc18c3010856029414b70cae1afc5cd9",
"canvaskit/skwasm.wasm": "6711032e17bf49924b2b001cef0d3ea3",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"manifest.json": "36985d7aece678a65eaf2f76a3796051"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
