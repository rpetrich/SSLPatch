// Patch in arm64 (public XNU headers don't support it, yet)
#ifdef __arm64__
#define CCN_UNIT_SIZE 8
#endif

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

#import "external/sslKeyExchange.c"

#pragma clang diagnostic pop
