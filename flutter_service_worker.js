'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"canvaskit/skwasm.js": "5d4f9263ec93efeb022bb14a3881d240",
"canvaskit/canvaskit.wasm": "9251bb81ae8464c4df3b072f84aa969b",
"canvaskit/canvaskit.js.symbols": "74a84c23f5ada42fe063514c587968c6",
"canvaskit/skwasm.js.symbols": "c3c05bd50bdf59da8626bbe446ce65a3",
"canvaskit/skwasm.wasm": "4051bfc27ba29bf420d17aa0c3a98bce",
"canvaskit/canvaskit.js": "738255d00768497e86aa4ca510cce1e1",
"canvaskit/chromium/canvaskit.wasm": "399e2344480862e2dfa26f12fa5891d7",
"canvaskit/chromium/canvaskit.js.symbols": "ee7e331f7f5bbf5ec937737542112372",
"canvaskit/chromium/canvaskit.js": "901bb9e28fac643b7da75ecfd3339f3f",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"manifest.json": "0af86f8f43b0178a2dd2069742cb6134",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter_bootstrap.js": "c256268d2872965b963fd16aba6f4727",
"version.json": "a20876bed8512571a7799e076d8bf7f6",
"index.html": "7fa4852df84972968118e5210e685c5d",
"/": "7fa4852df84972968118e5210e685c5d",
"main.dart.js": "8f8481b82349ba54fb69c0179fb702d6",
"assets/AssetManifest.json": "a7cc698c96fcd9a878b5d33b2d321369",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin.json": "6720931570c7cafca051fca08355a267",
"assets/fonts/MaterialIcons-Regular.otf": "aedd1603bd7841819709f241faac5fba",
"assets/assets/images/pfp.jpg": "5a5c509e2c2b0b315bbe0d7b10deed79",
"assets/assets/images/landing_img.png": "827ac94b74c3577109d4db4a611c21af",
"assets/assets/images/srm_logo_wname_light.png": "143e197a4a9b9300fc91561cb1e0109a",
"assets/assets/images/Rectangle%252014.png": "a81b709f093376b7fefb414b564e2b7d",
"assets/assets/images/bg_white.jpg": "7f1826acb33dd1376a67ffe6e0abaeea",
"assets/assets/images/srm_logo_wname_dark.png": "1f5cc600271a2dd15e0d992f35070e73",
"assets/assets/images/srm_logo.png": "1421c3ee8216be5a4a339ec24c710db5",
"assets/assets/images/Techutsav%2520Certificate%2520%25203.png": "86274db2bc1379dfa7d64836bacbceb4",
"assets/assets/images/bluebells.jpg": "d05b91ca17587b49c319d0abca09aeea",
"assets/assets/images/lw_logo_dark.png": "e1d33854cf59a18c40be7711f2e9cebd",
"assets/assets/images/lw_logo_light.png": "f9936f37409bb1c5cf705c7f1e14a25a",
"assets/assets/images/man-uploading-data.png": "192baabb2b0cf9792676de07d52f79d2",
"assets/assets/images/logo.png": "884c15354fbc7057e0a39ff0f221f432",
"assets/assets/images/google-icon.png": "57a3d257c3b6c4d783e4eeaab98e5b5d",
"assets/assets/icons/share_Icon.png": "ea1faebb0deac8341177437abbd57710",
"assets/assets/icons/calendar_icon.png": "3a21b6e5f6e7fc19c2b3a7b6e6e76bc3",
"assets/assets/icons/google-mail%25201.png": "db3be649cf3ddcdc2cbb909669e74b23",
"assets/assets/icons/researchgate.png": "482d0814bdb3fbaf6f66ccf5ee072dd3",
"assets/assets/icons/discussion_Icon.png": "87c261c88100fcd621dc7b8eedf7e213",
"assets/assets/icons/gmail.png": "914f309b3ed591d96f89876d70ff268f",
"assets/assets/icons/emojii_Icon.png": "a21b469074b42d168b6d12051e77e32a",
"assets/assets/icons/googlescholar.png": "a26970e4cfe5220ad1bddb020713a2ad",
"assets/assets/icons/up_vote_Icon.png": "366f3ee8ab21ace1982c3de081ccf460",
"assets/assets/icons/event%25201.png": "69aeb73c381ae4f5afd98ebd002c83fc",
"assets/assets/icons/bell.png": "10b014bccd31db36b99898de9a8f843c",
"assets/assets/icons/twitter.png": "6cbc75f6f9610c26d170ecea2fc8e277",
"assets/assets/icons/notification%25201.png": "b5fcad9eff330e2916a85422fb33f362",
"assets/assets/icons/image%25207.png": "cb7a3de4915d8257d90cd701bdb724cf",
"assets/assets/icons/github.png": "f8b44f12cb8cb8ec29783d46d730bc7e",
"assets/assets/icons/gallery_Icon.png": "8af831559bb7a483e05e2e0ec5d24ffe",
"assets/assets/icons/data_icon.png": "ff363b1f02db5ea57b7a6a5a98603ffa",
"assets/assets/icons/message.png": "93932fd62215f9d6e7421cc6ac7e33b9",
"assets/assets/icons/image%25204.png": "95d6ef67b0a80199b72b913431c42d9f",
"assets/assets/icons/calendar%25201.png": "7bac11179b4288b510e727fe3b721cb1",
"assets/assets/icons/discussion.png": "7178b9b80a9dcfb994643b8750e8e819",
"assets/assets/icons/image%25203.png": "48ce64ee3a4264bacd33f06eab40ea6e",
"assets/assets/icons/Polygon%25201.png": "a8dc62843e4d5b03e779547f71253500",
"assets/assets/icons/down_vote_Icon.png": "163384ee1aad02cf904a5d1385bcd47d",
"assets/NOTICES": "6333ed058da50160667990b186f1bfbe",
"assets/AssetManifest.bin": "bea8e0b3409f0fab01763e095d554a65",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"flutter.js": "383e55f7f3cce5be08fcf1f3881f585c"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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
