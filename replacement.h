#import <Security/oidsalg.h>
#import <sslDigests.h>
#import <sslMemory.h>
#import <tls_digest.h>
#import <sslCrypto.h>

const SecAsn1Oid *_CSSMOID_SHA1WithRSA;
const SecAsn1Oid *_CSSMOID_SHA256WithRSA;
const SecAsn1Oid *_CSSMOID_SHA384WithRSA;
OSStatus (*_ReadyHash)(const HashReference *ref, SSLBuffer *state);
int (*_SSLAllocBuffer)(SSLBuffer *buf, size_t length);
int (*_SSLFreeBuffer)(SSLBuffer *buf);
uint32_t (*_SSLDecodeInt)(const uint8_t *p, size_t length);
const HashReference (*_SSLHashMD5);
const HashReference (*_SSLHashSHA1);
const HashReference (*_SSLHashSHA256);
const HashReference (*_SSLHashSHA384);
OSStatus (*_sslEncodeDhParams)(SSLBuffer *blob, const SSLBuffer *prime, const SSLBuffer *generator);
OSStatus (*_sslFreePubKey)(SSLPubKey **pubKey);
OSStatus (*_sslGetPubKeyFromBits)(SSLContext *ctx, const SSLBuffer *modulus, const SSLBuffer *exponent, SSLPubKey **pubKey);
OSStatus (*_sslRawVerify)(SSLContext *ctx, SSLPubKey *pubKey, const uint8_t *plainText, size_t plainTextLen, const uint8_t *sig, size_t sigLen);
OSStatus (*_sslRsaVerify)(SSLContext *ctx, SSLPubKey *pubKey, const SecAsn1AlgId *algId, const uint8_t *plainText, size_t plainTextLen, const uint8_t *sig, size_t sigLen);
