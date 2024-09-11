'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"main.dart.js": "832666a78933a1948b976a2cef50ee2e",
"index.html": "623aa6ddd9ed36484a8c502b0fbd618d",
"/": "623aa6ddd9ed36484a8c502b0fbd618d",
"icons/Icon-512.png": "b21727458ea2c60356343347847fd95f",
"icons/Icon-maskable-192.png": "6ffc5201c5e118e797807fc0e96682f3",
"icons/Icon-192.png": "6ffc5201c5e118e797807fc0e96682f3",
"icons/Icon-maskable-512.png": "b21727458ea2c60356343347847fd95f",
"manifest.json": "a201cd617ccfe3fae4e6198b97e7a5c7",
"version.json": "a20876bed8512571a7799e076d8bf7f6",
"favicon.png": "f9151558a8094be6738eeddc17643a99",
"assets/fonts/MaterialIcons-Regular.otf": "611d2ffbbf20e6e2782089d4a388e193",
"assets/NOTICES": "950f274bdfc938c32b5e9b09d545cf26",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/assets/icons/team.png": "1f8838118415d32a1e89c57a5af68821",
"assets/assets/icons/googlescholar.png": "a26970e4cfe5220ad1bddb020713a2ad",
"assets/assets/icons/mail.png": "4cce5c5c43aae1395e42d533703184b4",
"assets/assets/icons/gallery_Icon.png": "8af831559bb7a483e05e2e0ec5d24ffe",
"assets/assets/icons/github.png": "f8b44f12cb8cb8ec29783d46d730bc7e",
"assets/assets/icons/degree.png": "3f9b0b48c9d9067842df5a23633c6bec",
"assets/assets/icons/business.png": "ce7a45121b18f13c7e4d18c61feb1aac",
"assets/assets/icons/science.png": "c1875bcc86ff795164a6d1684638cf4a",
"assets/assets/icons/about.png": "b6a2f3ec0c10877a8992b613dd059f83",
"assets/assets/icons/website.png": "4ae7a2a7d59433ef6182f89be9a03134",
"assets/assets/icons/twitter.png": "6cbc75f6f9610c26d170ecea2fc8e277",
"assets/assets/icons/law.png": "a0479d8bc890adf1c4f6900f906ae149",
"assets/assets/icons/researchgate.png": "482d0814bdb3fbaf6f66ccf5ee072dd3",
"assets/assets/icons/gmail.png": "914f309b3ed591d96f89876d70ff268f",
"assets/assets/icons/googlescholar_bg.png": "79cec3ffc195df1f24283593167c695b",
"assets/assets/icons/interests.png": "d6b0a72766707ec7449b44cadb039dec",
"assets/assets/images/srm_logo_wname_light.png": "143e197a4a9b9300fc91561cb1e0109a",
"assets/assets/images/man-uploading-data.png": "192baabb2b0cf9792676de07d52f79d2",
"assets/assets/images/empty-inbox.png": "2236b1560057ab148a49dead12e959d8",
"assets/assets/images/landing_img.png": "827ac94b74c3577109d4db4a611c21af",
"assets/assets/images/bg_white.jpg": "7f1826acb33dd1376a67ffe6e0abaeea",
"assets/assets/images/logo.png": "857db60c14c75de6f349d6d470755144",
"assets/assets/images/google-icon.png": "57a3d257c3b6c4d783e4eeaab98e5b5d",
"assets/assets/images/lw_logo_light.png": "f9936f37409bb1c5cf705c7f1e14a25a",
"assets/assets/images/srm_logo.png": "1421c3ee8216be5a4a339ec24c710db5",
"assets/assets/images/srm_logo_wname_dark.png": "1f5cc600271a2dd15e0d992f35070e73",
"assets/assets/images/pfp.jpg": "5a5c509e2c2b0b315bbe0d7b10deed79",
"assets/assets/images/lw_logo_dark.png": "e1d33854cf59a18c40be7711f2e9cebd",
"assets/AssetManifest.json": "3dc1473d4acd029c5fcbfb32e3582691",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/AssetManifest.bin.json": "42dbb20700e79484128a0a765161e6c2",
"assets/AssetManifest.bin": "669ad93e8888e2a56cd77cc127b27770",
"flutter_bootstrap.js": "e34628674ad9eebddabf5eb1c10ba4c1",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"flutter.js": "f393d3c16b631f36852323de8e583132"};
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
