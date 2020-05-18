#import "GetSubnetMask.h"
#import "ifaddrs.h"
#include <sys/types.h>
#include <netinet/in.h>
#import "arpa/inet.h"

@implementation GetSubnetMask

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(sampleMethod:(NSString *)stringArgument numberParameter:(nonnull NSNumber *)numberArgument callback:(RCTResponseSenderBlock)callback) {
    // TODO: Implement some actually useful functionality
    callback(@[[NSString stringWithFormat: @"numberArgument: %@ stringArgument: %@", numberArgument, stringArgument]]);
}


RCT_EXPORT_METHOD(getSubnet:(RCTResponseSenderBlock)callback) {
    NSDictionary *dictIPDetails;
    NSString *address = @"error";
    NSString *netmask = @"error";
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;int success = 0;
    
    // retrieve the current interfaces - returns 0 on success
    success = getifaddrs(&interfaces);
    if (success == 0) {
        temp_addr = interfaces;
        
        while(temp_addr != NULL) {
            // check if interface is en0 which is the wifi connection on the iPhone
            if(temp_addr->ifa_addr->sa_family == AF_INET) {
                if([@(temp_addr->ifa_name) isEqualToString:@"en0"]) {
                    address = @(inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr));
                    netmask = @(inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_netmask)->sin_addr));
                    // dictIPDetails = [NSDictionary dictionaryWithObjectsAndKeys:address,netmask];
                }
            }
            
            temp_addr = temp_addr->ifa_next;
        }
    }
    freeifaddrs(interfaces);
    
    NSArray *nativeModuleList = @[netmask];
    callback(nativeModuleList);
}


RCT_EXPORT_METHOD(getIpV4:(RCTResponseSenderBlock)callback) {
    NSDictionary *dictIPDetails;
    NSString *address = @"error";
    NSString *netmask = @"error";
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;int success = 0;
 
    // retrieve the current interfaces - returns 0 on success
    success = getifaddrs(&interfaces);
    if (success == 0) {
        temp_addr = interfaces;
 
            while(temp_addr != NULL) {
                // check if interface is en0 which is the wifi connection on the iPhone
                if(temp_addr->ifa_addr->sa_family == AF_INET) {
                    if([@(temp_addr->ifa_name) isEqualToString:@"en0"]) {
                        address = @(inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr));
                        netmask = @(inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_netmask)->sin_addr));
                        // dictIPDetails = [NSDictionary dictionaryWithObjectsAndKeys:address,netmask];
                    }
                }
 
                temp_addr = temp_addr->ifa_next;
            }
    }
    freeifaddrs(interfaces);
 
    NSArray *nativeModuleList = @[address];
    callback(nativeModuleList);
 }
 



@end
