#import <substrate.h>
#import <dlfcn.h>
#import <CoreFoundation/CoreFoundation.h>

typedef CFTypeRef (*WiFiCopyPropertyFn)(void *, CFStringRef);
static WiFiCopyPropertyFn orig_WiFiDeviceClientCopyProperty = NULL;

static CFTypeRef replaced_WiFiDeviceClientCopyProperty(void *client, CFStringRef key) {
    if (key && CFEqual(key, CFSTR("WAPIEnabled"))) {
        return NULL;
    }
    return orig_WiFiDeviceClientCopyProperty ? orig_WiFiDeviceClientCopyProperty(client, key) : NULL;
}

__attribute__((constructor)) static void WAPIHook17Init(void) {
    void *sym = dlsym(RTLD_DEFAULT, "WiFiDeviceClientCopyProperty");
    if (sym) {
        MSHookFunction(sym, (void *)&replaced_WiFiDeviceClientCopyProperty,
                       (void **)&orig_WiFiDeviceClientCopyProperty);
    }
}
