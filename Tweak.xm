#import <substrate.h>
#import <dlfcn.h>
#import <CoreFoundation/CoreFoundation.h>
#import <mach/mach.h>

typedef mach_port_t io_object_t;
typedef io_object_t io_registry_entry_t;
typedef UInt32 IOOptionBits;
typedef char io_name_t[128];

static const uint32_t swbh[] = {1, 0, 0, 0};

typedef CFTypeRef (*RegistrySearchFn)(io_registry_entry_t, const io_name_t, CFStringRef, CFAllocatorRef, IOOptionBits);
static RegistrySearchFn orig_registryEntry = NULL;

static CFTypeRef replaced_registryEntry(io_registry_entry_t entry,
                                        const io_name_t plane,
                                        CFStringRef key,
                                        CFAllocatorRef allocator,
                                        IOOptionBits options) {
    if (key && CFEqual(key, CFSTR("region-info"))) {
        return CFDataCreate(kCFAllocatorDefault, (const UInt8 *)"X/A", 4);
    }
    if (key && CFEqual(key, CFSTR("software-behavior"))) {
        return CFDataCreate(kCFAllocatorDefault, (const UInt8 *)&swbh, sizeof(swbh));
    }
    return orig_registryEntry ? orig_registryEntry(entry, plane, key, allocator, options) : NULL;
}

__attribute__((constructor)) static void Globalize17Init(void) {
    void *h = dlopen("/System/Library/Frameworks/IOKit.framework/IOKit", RTLD_LAZY | RTLD_LOCAL);
    void *sym = h ? dlsym(h, "IORegistryEntrySearchCFProperty") : dlsym(RTLD_DEFAULT, "IORegistryEntrySearchCFProperty");
    if (sym) {
        MSHookFunction(sym, (void *)&replaced_registryEntry, (void **)&orig_registryEntry);
    }
}
