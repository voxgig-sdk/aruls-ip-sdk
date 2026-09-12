import { ArulsIpEntityBase } from '../ArulsIpEntityBase';
import type { ArulsIpSDK } from '../ArulsIpSDK';
import type { Control } from '../types';
import type { IpAddress, IpAddressLoadMatch } from '../ArulsIpTypes';
declare class IpAddressEntity extends ArulsIpEntityBase<IpAddress> {
    constructor(client: ArulsIpSDK, entopts: any);
    make(this: IpAddressEntity): IpAddressEntity;
    load(this: any, reqmatch?: IpAddressLoadMatch, ctrl?: Control): Promise<IpAddressEntity>;
}
export { IpAddressEntity };
