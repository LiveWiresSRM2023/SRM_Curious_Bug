'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/AssetManifest.bin.json": "42dbb20700e79484128a0a765161e6c2",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/assets/icons/gmail.png": "914f309b3ed591d96f89876d70ff268f",
"assets/assets/icons/business.png": "ce7a45121b18f13c7e4d18c61feb1aac",
"assets/assets/icons/science.png": "c1875bcc86ff795164a6d1684638cf4a",
"assets/assets/icons/researchgate.png": "482d0814bdb3fbaf6f66ccf5ee072dd3",
"assets/assets/icons/law.png": "a0479d8bc890adf1c4f6900f906ae149",
"assets/assets/icons/twitter.png": "6cbc75f6f9610c26d170ecea2fc8e277",
"assets/assets/icons/team.png": "1f8838118415d32a1e89c57a5af68821",
"assets/assets/icons/googlescholar_bg.png": "79cec3ffc195df1f24283593167c695b",
"assets/assets/icons/website.png": "4ae7a2a7d59433ef6182f89be9a03134",
"assets/assets/icons/googlescholar.png": "a26970e4cfe5220ad1bddb020713a2ad",
"assets/assets/icons/github.png": "f8b44f12cb8cb8ec29783d46d730bc7e",
"assets/assets/icons/about.png": "b6a2f3ec0c10877a8992b613dd059f83",
"assets/assets/icons/interests.png": "d6b0a72766707ec7449b44cadb039dec",
"assets/assets/icons/degree.png": "3f9b0b48c9d9067842df5a23633c6bec",
"assets/assets/icons/gallery_Icon.png": "8af831559bb7a483e05e2e0ec5d24ffe",
"assets/assets/icons/mail.png": "4cce5c5c43aae1395e42d533703184b4",
"assets/assets/images/lw_logo_light.png": "f9936f37409bb1c5cf705c7f1e14a25a",
"assets/assets/images/srm_logo_wname_light.png": "143e197a4a9b9300fc91561cb1e0109a",
"assets/assets/images/empty-inbox.png": "2236b1560057ab148a49dead12e959d8",
"assets/assets/images/srm_logo_wname_dark.png": "1f5cc600271a2dd15e0d992f35070e73",
"assets/assets/images/lw_logo_dark.png": "e1d33854cf59a18c40be7711f2e9cebd",
"assets/assets/images/bg_white.jpg": "7f1826acb33dd1376a67ffe6e0abaeea",
"assets/assets/images/landing_img.png": "827ac94b74c3577109d4db4a611c21af",
"assets/assets/images/man-uploading-data.png": "192baabb2b0cf9792676de07d52f79d2",
"assets/assets/images/pfp.jpg": "5a5c509e2c2b0b315bbe0d7b10deed79",
"assets/assets/images/srm_logo.png": "1421c3ee8216be5a4a339ec24c710db5",
"assets/assets/images/logo.png": "857db60c14c75de6f349d6d470755144",
"assets/assets/images/google-icon.png": "57a3d257c3b6c4d783e4eeaab98e5b5d",
"assets/fonts/MaterialIcons-Regular.otf": "fd8a7dde42cde5e40cd961079c23683c",
"assets/AssetManifest.bin": "669ad93e8888e2a56cd77cc127b27770",
"assets/AssetManifest.json": "3dc1473d4acd029c5fcbfb32e3582691",
"assets/NOTICES": "950f274bdfc938c32b5e9b09d545cf26",
"index.html": "64f25142dc5613d9091dc5a335ea8679",
"/": "64f25142dc5613d9091dc5a335ea8679",
"main.dart.js": "0e329cd9a9e00de05702e605f8ff8610",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"version.json": "a20876bed8512571a7799e076d8bf7f6",
"flutter_bootstrap.js": "a9e1feb2f9c50a4722a65b9ed44bef84",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.js": "87325e67bf77a9b483250e1fb1b54677",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/canvaskit.js": "5fda3f1af7d6433d53b24083e2219fa0",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"canvaskit/skwasm.js": "9fa2ffe90a40d062dd2343c7b84caf01",
"manifest.json": "e42837193aed540806d05579314b559b",
"flutter.js": "f31737fb005cd3a3c6bd9355efd33061"};
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
