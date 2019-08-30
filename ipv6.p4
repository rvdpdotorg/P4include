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

#ifndef _IPV6_P4_
#define _IPV6_P4_

#include "protocols.p4"

/*
 * RFC 8200: Internet Protocol, Version 6 (IPv6) Specification, July 2017
 */

typedef bit<128> ipv6_addr_t;

header ipv6_h {
    bit<4> version;
    bit<6> dscp;
    bit<2> ecn;
    bit<20> flowlabel;
    bit<16> payload_len;        // in octets
    bit<8> nexthdr;
    bit<8> hoplimit;
    ipv6_addr_t saddr;
    ipv6_addr_t daddr;
}

// RFC 8200, section 4.3, Hop-by-Hop Options Extension Header
header ipv6_ext_hdr_option_h {
    bit<8> nexthdr;
    bit<8> length;          // Length of Hop-by-Hop Options header
                            // in 8-octet units,
                            // not including 1st 8 octets
    bit<8> option_type;
    bit<8> option_length;   // in octets
}

// RFC 8200, section 4.4, Routing Extension Header
header ipv6_routing_hdr_h {
    bit<8> nexthdr;
    bit<8> length;          // Length of Option Data Field in octets
    bit<8> type;
    bit<8> segments_left;
}

// RFC 8200, section 4.5, Fragment Extension Header
header ipv6_fragment_hdr_h {
    bit<8>  nexthdr;
    bit<8>  rsvd1;
    bit<13> fragment_offset;
    bit<2>  rsvd2;
    bit<1>  more_fragments;
    bit<32> id;
}

header ipv6_pad_type_h {
    bit<8> type;
}

header ipv6_pad_length_h {
    bit<8> length;
}

header ipv6_pad3_data_h {
    bit<8>      data;
}

header ipv6_pad4_data_h {
    bit<16>     data;
}

header ipv6_pad5_data_h {
    bit<24>     data;
}

header ipv6_pad6_data_h {
    bit<32>     data;
}

header ipv6_pad7_data_h {
    bit<40>     data;
}

#endif  /* _IPV6_P4_ */
