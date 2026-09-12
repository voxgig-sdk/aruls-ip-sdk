import { ArulsIpEntityBase } from '../ArulsIpEntityBase';
import type { ArulsIpSDK } from '../ArulsIpSDK';
import type { Control } from '../types';
import type { Ipn, IpnLoadMatch } from '../ArulsIpTypes';
declare class IpnEntity extends ArulsIpEntityBase<Ipn> {
    constructor(client: ArulsIpSDK, entopts: any);
    make(this: IpnEntity): IpnEntity;
    load(this: any, reqmatch?: IpnLoadMatch, ctrl?: Control): Promise<IpnEntity>;
}
export { IpnEntity };
