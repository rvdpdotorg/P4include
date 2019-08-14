/*
 * Copyright 2018-present Ronald van der Pol <Ronald.vanderPol@rvdp.org>
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

#ifndef _IOAM_P4_
#define _IOAM_P4_

/*
 * draft-ietf-ippm-ioam-data-06
 */

/* Pre-allocated and incremental trace option headers */
header ioam_trace_option_h {
    bit<16>  namespace_id;   // 16-bit identifier of an IOAM namespace.

    bit<5>   node_length;    // Length of data added by each node in
                             // multiples of 4-octets, excluding the
                             // length of the "Opaque State Snapshot"
                             // field.

    bit<4>   flags;          // The current document allocates a single
                             // flag as follows:
                             // Bit 0  "Overflow" (O-bit)
                             //         (most significant bit).
                             // This bit is set by the network element
                             // if there are not enough octets left to
                             // record node data, no field is added and
                             // the overflow "O-bit" must be set to "1"
                             // in the header.  This is useful for
                             // transit nodes to ignore further processing
                             // of the option.

    bit<7>   remaining;      // This field specifies the data space in
                             // multiples of 4-octets remaining for
                             // recording the node data, before the node
                             // data list is considered to have overflowed.

    bit<24>  type;           // Bit field which specifies which data types
                             // are used in this node data list.

    bit<8>   reserved;       // Must be zero.
}

/* Hop limit and node ID */
header ioam_hop_limit_node_id_h {
    bit<8>  hop_limit;
    bit<24> node_id;
}

/* Ingress interface ID and egress interface ID */
header ioam_ingress_if_id_egress_if_id_h {
    bit<16> ingress_if_id;
    bit<16> egress_if_id;
}

/* Timestamp seconds */
header ioam_timestamp_sec_h {
    bit<32> timestamp_sec;      // Absolute timestamp in seconds that
                                // specifies the time at which the packet
                                // was received by the node.
}

/* Timestamp subseconds */
header ioam_timestamp_subsec_h {
    bit<32> timestamp_subsec;   // Absolute timestamp in subseconds that
                                // specifies the time at which the packet
                                // was received by the node. Contains the
                                // 32 least significant bits of the
                                // timestamp format.
}

/* Transit delay */
header ioam_transit_delay_h {
    bit<32> transit_delay;      // Time in nanoseconds the packet spent
                                // in the transit node.
}

/* Namespace specific data */
header ioam_namespace_data_h {
    bit<32> namespace_data;
}

/* Queue depth */
header ioam_queue_depth_h {
    bit<32> queue_depth;
}

/* Opaque state snapshot */
header ioam_opaque_state_h {
    bit<8>  length;             // Length in multiples of 4-octets of the
                                // Opaque data field that follows Schema ID.
    bit<24> schema_id;
}

/* Hop limit and node ID wide */
header ioam_hop_limit_node_id_wide_h {
    bit<8>  hop_limit;
    bit<56> node_id;
}

/* Ingress interface ID and egress interface ID wide */
header ioam_ingress_if_id_egress_if_id_wide_h {
    bit<32> ingress_if_id;
    bit<32> egress_if_id;
}

/* Namespace specific data wide */
header ioam_namespace_data_wide_h {
    bit<64> namespace_data;
}

/* Buffer occupancy */
header ioam_buffer_occupancy_h {
    bit<32> buffer_occupancy;
}

/* Checksum complement */
header ioam_checksum_complement_h {
    bit<32> checksum_complement;
}

#endif  /* _IOAM_P4_ */
