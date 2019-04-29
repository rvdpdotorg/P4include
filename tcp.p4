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

#ifndef _TCP_P4_
#define _TCP_P4_

/*
 * STD 7 / RFC 793: Transmission Control Protocol, September 1981
 * RFC 3168: The Addition of Explicit Congestion Notification (ECN) to IP,
 *           September 2001
 */

header tcp_h {
    bit<16> src_port;
    bit<16> dst_port;
    bit<32> seq_nr;
    bit<32> ack_nr;
    bit<4> data_offset;
    bit<4> reserved;
    bit<1> cwr_flag;
    bit<1> ece_flag;
    bit<1> urg_flag;
    bit<1> ack_flag;
    bit<1> psh_flag;
    bit<1> rst_flag;
    bit<1> syn_flag;
    bit<1> fin_flag;
    bit<16> window;
    bit<16> cksum;
    bit<16> urgent_ptr;
}

#endif  /* _TCP_P4_ */
