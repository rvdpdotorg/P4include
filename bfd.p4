/*
 * Copyright [2018-present] Ronald van der Pol <Ronald.vanderPol@rvdp.org>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef _BFD_P4_
#define _BFD_P4_

/*
 * RFC 5880: Bidirectional Forwarding Detection (BFD), June 2010
 */

header udp_h {
    bit<3>  version;
    bit<5>  diag;
    bit<2>  state;
    bit<1>  P;
    bit<i>  F;
    bit<1>  C;
    bit<1>  A;
    bit<1>  D;
    bit<1>  M;
    bit<8>  multiplier;
    bit<8>  len;
    bit<32> loc_discr;
    bit<32> rem_discr;
    bit<32> tx_interval;
    bit<32> rx_interval;
    bit<32> echo_interval;
}

#endif  /* _BFD_P4_ */
