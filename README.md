# react-native-get-subnet-mask

Rewriten modules from maxto024/get-subnet-mask,
using create-react-native-module

## Getting started

`$ npm install react-native-get-subnet-mask --save`

### Mostly automatic installation

`$ react-native link react-native-get-subnet-mask`

## Usage
```javascript
import GetSubnetMask from 'react-native-get-subnet-mask';

// TODO: What to do with the module?
GetSubnetMask;
```

getSubnet() return the subnet mask value.
```
import SubnetmaskModule from ‘get-subnet-mask’;

SubnetmaskModule.getSubnet((sb) => { 

    console.log(sb);

});

```

getIpV4() return the IP value.
```
import SubnetmaskModule from ‘get-subnet-mask’;

SubnetmaskModule.getIpV4((ip) => { 

    console.log(ip);

});

```

##Install

1. `npm install get-subnet-mask`
2. `react-native link`


# License
MIT


