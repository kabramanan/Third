CREATE KEYSPACE fgw_supplier_item_store_stg0 WITH replication = {'class': 'SimpleStrategy', 'replication_factor': '1'}  AND durable_writes = true;

CREATE TABLE fgw_supplier_item_store_stg0.item_shards (
    feed_id text,
    sku text,
    sku_index int,
    shard int,
    PRIMARY KEY (feed_id, sku, sku_index)
) WITH CLUSTERING ORDER BY (sku ASC, sku_index ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE fgw_supplier_item_store_stg0.txn_trail (
    id text,
    txn_type text,
    ts_unique_id text,
    value text,
    PRIMARY KEY (id, txn_type, ts_unique_id)
) WITH CLUSTERING ORDER BY (txn_type DESC, ts_unique_id DESC)
    AND bloom_filter_fp_chance = 0.1
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.LeveledCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE fgw_supplier_item_store_stg0.item_table (
    vendor_id text,
    sku text,
    identifier_key text,
    identifier_value text,
    category text,
    created_dtm timestamp,
    current_state text,
    end_state text,
    end_state_dtm timestamp,
    feed_id text,
    mart_id text,
    modified_dtm timestamp,
    offer_id text,
    si_number text,
    spec_version text,
    subcategory text,
    wpid text,
    PRIMARY KEY (vendor_id, sku, identifier_key, identifier_value)
) WITH CLUSTERING ORDER BY (sku ASC, identifier_key ASC, identifier_value ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'max_threshold': '32', 'min_threshold': '4', 'cold_reads_to_omit': '0.05', 'enabled': 'true', 'unchecked_tombstone_compaction': 'false', 'tombstone_compaction_interval': '86400', 'min_sstable_size': '50', 'tombstone_threshold': '0.2', 'bucket_low': '0.5', 'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy', 'bucket_high': '1.5'}
    AND compression = {'chunk_length_kb': '64', 'crc_check_chance': '1.0', 'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.0
    AND default_time_to_live = 2592000
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.1
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE fgw_supplier_item_store_stg0.iso_nonindexed_response (
    key text PRIMARY KEY,
    iso_response text
) WITH bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE fgw_supplier_item_store_stg0.feedstatus (
    feed_id text PRIMARY KEY,
    app_ map<text, text>,
    batch_id text,
    correlation_id text,
    created_by text,
    created_dtm timestamp,
    data_error_count int,
    entity_count text,
    entity_count_processed int,
    error list<text>,
    error_code text,
    error_message text,
    feed_source text,
    feed_status text,
    feed_submitted_dtm timestamp,
    feed_type text,
    file_name text,
    is_gmp_partner boolean,
    istr_ map<text, text>,
    locale text,
    mart_id text,
    modified_by text,
    modified_dtm timestamp,
    org_id text,
    partner_id text,
    seller_id text,
    solr_query text,
    success_count int,
    system_error_count int,
    tenant_id text,
    timeout_error_count int,
    transaction_id text,
    version text
) WITH bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE fgw_supplier_item_store_stg0.feeditemstatus (
    feed_id text,
    sku text,
    app_ map<text, text>,
    batch_id text,
    client_dialog list<text>,
    correlation_id text,
    created_dtm timestamp,
    crossref_item_id text,
    error list<text>,
    feed_submitted_dtm timestamp,
    iso_job_id text,
    iso_request text,
    iso_response text,
    istr_ map<text, text>,
    item_index text,
    item_payload text,
    item_processing_route text,
    item_processing_state text,
    item_processing_status text,
    item_processing_type text,
    mart_id text,
    modified_dtm timestamp,
    offer_id text,
    orgid text,
    qarth_request text,
    qarth_response text,
    rca_requested_dtm timestamp,
    schedule_response list<text>,
    seller_id text,
    solr_query text,
    version text,
    wpid text,
    wpid_requested_dtm timestamp,
    PRIMARY KEY (feed_id, sku)
) WITH CLUSTERING ORDER BY (sku ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE fgw_supplier_item_store_stg0.feed_item_status (
    feed_id text,
    shard int,
    sku_index int,
    sku text,
    batch_id text,
    correlation_id text,
    created_dtm timestamp,
    crossref_item_id text,
    error list<text>,
    feed_submitted_dtm timestamp,
    ids_ map<text, text>,
    ingestion_status text,
    iso_job_id text,
    istr_ map<text, text>,
    item_index text,
    item_processing_internal_route text,
    item_processing_internal_state text,
    item_processing_route text,
    item_processing_state text,
    item_processing_status text,
    item_processing_type text,
    mart_id text,
    modified_dtm timestamp,
    offer_id text,
    orgid text,
    rca_requested_dtm timestamp,
    schedule_response list<text>,
    seller_id text,
    version text,
    wpid text,
    wpid_requested_dtm timestamp,
    PRIMARY KEY ((feed_id, shard), sku_index, sku)
) WITH CLUSTERING ORDER BY (sku_index ASC, sku ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'max_threshold': '32', 'min_threshold': '4', 'cold_reads_to_omit': '0.05', 'enabled': 'true', 'unchecked_tombstone_compaction': 'false', 'tombstone_compaction_interval': '86400', 'min_sstable_size': '50', 'tombstone_threshold': '0.2', 'bucket_low': '0.5', 'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy', 'bucket_high': '1.5'}
    AND compression = {'chunk_length_kb': '64', 'crc_check_chance': '1.0', 'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.0
    AND default_time_to_live = 2592000
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.1
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE fgw_supplier_item_store_stg0.feed_item_status_index (
    feed_id text,
    shard int,
    sku text,
    sku_index int,
    batch_id text,
    correlation_id text,
    created_dtm timestamp,
    crossref_item_id text,
    error list<text>,
    feed_submitted_dtm timestamp,
    iso_job_id text,
    istr_ map<text, text>,
    item_index text,
    item_processing_route text,
    item_processing_state text,
    item_processing_status text,
    item_processing_type text,
    mart_id text,
    modified_dtm timestamp,
    offer_id text,
    orgid text,
    rca_requested_dtm timestamp,
    seller_id text,
    solr_query text,
    version text,
    wpid text,
    wpid_requested_dtm timestamp,
    PRIMARY KEY ((feed_id, shard, sku, sku_index))
) WITH bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.0
    AND default_time_to_live = 2592000
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.1
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE fgw_supplier_item_store_stg0.wercs_status (
    gtin text PRIMARY KEY,
    attr_ map<text, text>,
    created_at timestamp,
    created_by text,
    status text,
    updated_at timestamp,
    updated_by text
) WITH bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE fgw_supplier_item_store_stg0.item_table1 (
    vendor_id text,
    sku text,
    identifier_key text,
    identifier_value text,
    category text,
    created_dtm timestamp,
    current_state text,
    end_state text,
    end_state_dtm timestamp,
    feed_id text,
    mart_id text,
    modified_dtm timestamp,
    offer_id text,
    si_number text,
    spec_version text,
    subcategory text,
    wpid text,
    PRIMARY KEY ((vendor_id, sku), identifier_key, identifier_value)
) WITH CLUSTERING ORDER BY (identifier_key ASC, identifier_value ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'max_threshold': '32', 'min_threshold': '4', 'cold_reads_to_omit': '0.05', 'enabled': 'true', 'unchecked_tombstone_compaction': 'false', 'tombstone_compaction_interval': '86400', 'min_sstable_size': '50', 'tombstone_threshold': '0.2', 'bucket_low': '0.5', 'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy', 'bucket_high': '1.5'}
    AND compression = {'chunk_length_kb': '64', 'crc_check_chance': '1.0', 'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.0
    AND default_time_to_live = 2592000
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.1
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE fgw_supplier_item_store_stg0.white_listed_item (
    vendor_id text,
    upc text,
    created_at timestamp,
    created_by text,
    status text,
    updated_at timestamp,
    updated_by text,
    PRIMARY KEY (vendor_id, upc)
) WITH CLUSTERING ORDER BY (upc ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE fgw_supplier_item_store_stg0.item (
    partner_id text,
    sku text,
    mart_id int,
    category text,
    channel_type text,
    created_by text,
    created_dtm timestamp,
    currency text,
    current_price text,
    error list<text>,
    feed_id text,
    feed_submitted_dtm timestamp,
    gtin text,
    ingestion_status text,
    item_id text,
    locale text,
    modified_dtm timestamp,
    offer_id text,
    org_id text,
    processing_state text,
    processing_type text,
    product_name text,
    seller_id text,
    selling_channel text,
    short_description text,
    si_number text,
    si_type text,
    spec_version text,
    subcategory text,
    updated_by text,
    vendor_contract_number text,
    vertical_id text,
    wpid text,
    PRIMARY KEY (partner_id, sku, mart_id)
) WITH CLUSTERING ORDER BY (sku ASC, mart_id ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'max_threshold': '32', 'min_threshold': '4', 'cold_reads_to_omit': '0.05', 'enabled': 'true', 'unchecked_tombstone_compaction': 'false', 'tombstone_compaction_interval': '86400', 'min_sstable_size': '50', 'tombstone_threshold': '0.2', 'bucket_low': '0.5', 'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy', 'bucket_high': '1.5'}
    AND compression = {'chunk_length_kb': '64', 'crc_check_chance': '1.0', 'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.0
    AND default_time_to_live = 2592000
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.1
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE fgw_supplier_item_store_stg0.item_payload (
    vendor_id text,
    gtin text,
    fg_feedid text,
    created_at timestamp,
    created_by text,
    fg_correlationid text,
    iso_req text,
    iso_req_created_at timestamp,
    iso_resp text,
    iso_resp_created_at timestamp,
    qarth_req text,
    qarth_req_created_at timestamp,
    qarth_resp text,
    qarth_resp_created_at timestamp,
    updated_at timestamp,
    updated_by text,
    PRIMARY KEY ((vendor_id, gtin), fg_feedid)
) WITH CLUSTERING ORDER BY (fg_feedid ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE fgw_supplier_item_store_stg0.txn_trail_copy1 (
    id text,
    txn_type text,
    ts_unique_id text,
    value text,
    PRIMARY KEY (id, txn_type, ts_unique_id)
) WITH CLUSTERING ORDER BY (txn_type ASC, ts_unique_id DESC)
    AND bloom_filter_fp_chance = 0.1
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.LeveledCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE fgw_supplier_item_store_stg0.item_ingestion_history (
    vendor_id text,
    sku text,
    identifier_key text,
    identifier_value text,
    created_dtm timestamp,
    current_state text,
    end_state text,
    end_state_dtm timestamp,
    feed_id text,
    modified_dtm timestamp,
    PRIMARY KEY (vendor_id, sku, identifier_key, identifier_value)
) WITH CLUSTERING ORDER BY (sku ASC, identifier_key ASC, identifier_value ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'max_threshold': '32', 'min_threshold': '4', 'cold_reads_to_omit': '0.05', 'enabled': 'true', 'unchecked_tombstone_compaction': 'false', 'tombstone_compaction_interval': '86400', 'min_sstable_size': '50', 'tombstone_threshold': '0.2', 'bucket_low': '0.5', 'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy', 'bucket_high': '1.5'}
    AND compression = {'chunk_length_kb': '64', 'crc_check_chance': '1.0', 'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.0
    AND default_time_to_live = 2592000
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.1
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE fgw_supplier_item_store_stg0.object_store (
    object_key text PRIMARY KEY,
    object_value blob
) WITH bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.LeveledCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.0
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.1
    AND speculative_retry = '99.0PERCENTILE';

CREATE KEYSPACE iso_rt_txn_stg0 WITH replication = {'class': 'SimpleStrategy', 'replication_factor': '1'}  AND durable_writes = true;

CREATE TABLE iso_rt_txn_stg0.iso_rt_txn (
    jobid text,
    type text,
    rtname text,
    correlationid text,
    feedid text,
    shard text,
    sku text,
    skuindex text,
    key text,
    reqresp text,
    PRIMARY KEY (jobid, type, rtname, correlationid, feedid, shard, sku, skuindex)
) WITH CLUSTERING ORDER BY (type ASC, rtname ASC, correlationid ASC, feedid ASC, shard ASC, sku ASC, skuindex ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'max_threshold': '32', 'min_threshold': '4', 'cold_reads_to_omit': '0.05', 'enabled': 'true', 'unchecked_tombstone_compaction': 'false', 'tombstone_compaction_interval': '86400', 'min_sstable_size': '50', 'tombstone_threshold': '0.2', 'bucket_low': '0.5', 'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy', 'bucket_high': '1.5'}
    AND compression = {'chunk_length_kb': '64', 'crc_check_chance': '1.0', 'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 432000
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE KEYSPACE reaper_db WITH replication = {'class': 'SimpleStrategy', 'replication_factor': '1'}  AND durable_writes = true;

CREATE TABLE reaper_db.running_reapers (
    reaper_instance_id uuid PRIMARY KEY,
    last_heartbeat timestamp,
    reaper_instance_host text
) WITH bloom_filter_fp_chance = 0.1
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.LeveledCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 180
    AND gc_grace_seconds = 180
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE reaper_db.repair_unit_v1 (
    id timeuuid PRIMARY KEY,
    cluster_name text,
    column_families set<text>,
    incremental_repair boolean,
    keyspace_name text,
    nodes set<text>
) WITH bloom_filter_fp_chance = 0.1
    AND caching = '{"keys":"NONE", "rows_per_partition":"1"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.LeveledCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE reaper_db.repair_schedule_by_cluster_and_keyspace (
    cluster_name text,
    keyspace_name text,
    repair_schedule_id timeuuid,
    PRIMARY KEY ((cluster_name, keyspace_name), repair_schedule_id)
) WITH CLUSTERING ORDER BY (repair_schedule_id ASC)
    AND bloom_filter_fp_chance = 0.1
    AND caching = '{"keys":"NONE", "rows_per_partition":"10"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.LeveledCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE reaper_db.repair_run_by_cluster (
    cluster_name text,
    id timeuuid,
    PRIMARY KEY (cluster_name, id)
) WITH CLUSTERING ORDER BY (id ASC)
    AND bloom_filter_fp_chance = 0.1
    AND caching = '{"keys":"NONE", "rows_per_partition":"ALL"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.LeveledCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE reaper_db.repair_schedule_v1 (
    id timeuuid PRIMARY KEY,
    creation_time timestamp,
    days_between int,
    intensity double,
    next_activation timestamp,
    owner text,
    pause_time timestamp,
    repair_parallelism text,
    repair_unit_id timeuuid,
    run_history set<timeuuid>,
    segment_count int,
    state text
) WITH bloom_filter_fp_chance = 0.1
    AND caching = '{"keys":"NONE", "rows_per_partition":"1"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.LeveledCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE reaper_db.schema_migration (
    applied_successful boolean,
    version int,
    executed_at timestamp,
    script text,
    script_name text,
    PRIMARY KEY (applied_successful, version)
) WITH CLUSTERING ORDER BY (version ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE reaper_db.cluster (
    name text PRIMARY KEY,
    partitioner text,
    seed_hosts set<text>
) WITH bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"NONE", "rows_per_partition":"ALL"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.LeveledCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE reaper_db.node_metrics (
    host_address text PRIMARY KEY,
    active_anticompactions int,
    datacenter text,
    has_repair_running boolean,
    pending_compactions int
) WITH bloom_filter_fp_chance = 0.1
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.LeveledCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 180
    AND gc_grace_seconds = 180
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE reaper_db.repair_unit (
    id bigint PRIMARY KEY,
    cluster_name text,
    column_families set<text>,
    incremental_repair boolean,
    keyspace_name text
) WITH bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"NONE", "rows_per_partition":"10"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.LeveledCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE reaper_db.repair_schedule (
    id bigint PRIMARY KEY,
    creation_time timestamp,
    days_between int,
    intensity double,
    next_activation timestamp,
    owner text,
    pause_time timestamp,
    repair_parallelism text,
    repair_unit_id bigint,
    run_history set<bigint>,
    segment_count int,
    state text
) WITH bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"NONE", "rows_per_partition":"10"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.LeveledCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE reaper_db.repair_run (
    id timeuuid,
    segment_id timeuuid,
    cause text static,
    cluster_name text static,
    coordinator_host text,
    creation_time timestamp static,
    end_time timestamp static,
    end_token varint,
    fail_count int,
    intensity double static,
    last_event text static,
    owner text static,
    pause_time timestamp static,
    repair_parallelism text static,
    repair_unit_id timeuuid static,
    segment_count int static,
    segment_end_time timestamp,
    segment_start_time timestamp,
    segment_state int,
    start_time timestamp static,
    start_token varint,
    state text static,
    PRIMARY KEY (id, segment_id)
) WITH CLUSTERING ORDER BY (segment_id ASC)
    AND bloom_filter_fp_chance = 0.1
    AND caching = '{"keys":"NONE", "rows_per_partition":"5000"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.LeveledCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE reaper_db.repair_run_by_unit (
    repair_unit_id timeuuid,
    id timeuuid,
    PRIMARY KEY (repair_unit_id, id)
) WITH CLUSTERING ORDER BY (id ASC)
    AND bloom_filter_fp_chance = 0.1
    AND caching = '{"keys":"NONE", "rows_per_partition":"ALL"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.LeveledCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE reaper_db.leader (
    leader_id timeuuid PRIMARY KEY,
    last_heartbeat timestamp,
    reaper_instance_host text,
    reaper_instance_id uuid
) WITH bloom_filter_fp_chance = 0.1
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.LeveledCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 600
    AND gc_grace_seconds = 600
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE KEYSPACE glb_partner_api_store_cass_stg0 WITH replication = {'class': 'SimpleStrategy', 'replication_factor': '1'}  AND durable_writes = true;

CREATE TABLE glb_partner_api_store_cass_stg0.item_shards (
    feed_id text,
    sku text,
    sku_index int,
    shard int,
    PRIMARY KEY (feed_id, sku, sku_index)
) WITH CLUSTERING ORDER BY (sku ASC, sku_index ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE glb_partner_api_store_cass_stg0.txn_trail (
    id text,
    txn_type text,
    ts_unique_id text,
    value text,
    PRIMARY KEY (id, txn_type, ts_unique_id)
) WITH CLUSTERING ORDER BY (txn_type DESC, ts_unique_id DESC)
    AND bloom_filter_fp_chance = 0.1
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.LeveledCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE glb_partner_api_store_cass_stg0.partnerapi_throttle_config (
    client_id text,
    domain_id text,
    service_name text,
    operation_name text,
    app_ map<text, text>,
    cacherefresh_duration bigint,
    input_data_size bigint,
    replenish_duration bigint,
    replenish_tokens bigint,
    PRIMARY KEY (client_id, domain_id, service_name, operation_name)
) WITH CLUSTERING ORDER BY (domain_id ASC, service_name ASC, operation_name ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 0
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE glb_partner_api_store_cass_stg0.iso_nonindexed_response (
    key text PRIMARY KEY,
    iso_response text
) WITH bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE glb_partner_api_store_cass_stg0.feedstatus (
    feed_id text PRIMARY KEY,
    app_ map<text, text>,
    batch_id text,
    correlation_id text,
    created_by text,
    created_dtm timestamp,
    data_error_count int,
    entity_count text,
    entity_count_processed int,
    error list<text>,
    error_code text,
    error_message text,
    feed_source text,
    feed_status text,
    feed_submitted_dtm timestamp,
    feed_type text,
    file_name text,
    is_gmp_partner boolean,
    istr_ map<text, text>,
    locale text,
    mart_id text,
    modified_by text,
    modified_dtm timestamp,
    org_id text,
    partner_id text,
    seller_id text,
    solr_query text,
    success_count int,
    system_error_count int,
    tenant_id text,
    timeout_error_count int,
    transaction_id text,
    version text
) WITH bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE glb_partner_api_store_cass_stg0.feeditemstatus (
    feed_id text,
    sku text,
    app_ map<text, text>,
    batch_id text,
    client_dialog list<text>,
    correlation_id text,
    created_dtm timestamp,
    crossref_item_id text,
    error list<text>,
    feed_submitted_dtm timestamp,
    iso_job_id text,
    iso_request text,
    iso_response text,
    istr_ map<text, text>,
    item_index text,
    item_payload text,
    item_processing_route text,
    item_processing_state text,
    item_processing_status text,
    item_processing_type text,
    mart_id text,
    modified_dtm timestamp,
    offer_id text,
    orgid text,
    qarth_request text,
    qarth_response text,
    rca_requested_dtm timestamp,
    schedule_response list<text>,
    seller_id text,
    solr_query text,
    version text,
    wpid text,
    wpid_requested_dtm timestamp,
    PRIMARY KEY (feed_id, sku)
) WITH CLUSTERING ORDER BY (sku ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.LeveledCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.0
    AND default_time_to_live = 2592000
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.1
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE glb_partner_api_store_cass_stg0.activity_item (
    activity_id text,
    identifier text,
    assigned_dtm timestamp,
    assigned_to text,
    batch_id text,
    comments list<text>,
    created_by text,
    created_dtm timestamp,
    error list<text>,
    feed_id text,
    feed_item_id text,
    identifier_type text,
    istr_ map<text, text>,
    item_id text,
    mart_id text,
    modified_by text,
    modified_dtm timestamp,
    offer_id text,
    org_id text,
    partner_id text,
    payload text,
    product_id text,
    seller_id text,
    source text,
    state text,
    status text,
    type text,
    updated_by text,
    vendor_id text,
    version text,
    PRIMARY KEY (activity_id, identifier)
) WITH CLUSTERING ORDER BY (identifier ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'max_threshold': '32', 'min_threshold': '4', 'cold_reads_to_omit': '0.05', 'enabled': 'true', 'unchecked_tombstone_compaction': 'false', 'tombstone_compaction_interval': '86400', 'min_sstable_size': '50', 'tombstone_threshold': '0.2', 'bucket_low': '0.5', 'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy', 'bucket_high': '1.5'}
    AND compression = {'chunk_length_kb': '64', 'crc_check_chance': '1.0', 'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE glb_partner_api_store_cass_stg0.feed_item_status (
    feed_id text,
    shard int,
    sku_index int,
    sku text,
    batch_id text,
    correlation_id text,
    created_dtm timestamp,
    crossref_item_id text,
    error list<text>,
    feed_submitted_dtm timestamp,
    ids_ map<text, text>,
    ingestion_status text,
    iso_job_id text,
    istr_ map<text, text>,
    item_index text,
    item_processing_internal_route text,
    item_processing_internal_state text,
    item_processing_route text,
    item_processing_state text,
    item_processing_status text,
    item_processing_type text,
    mart_id text,
    modified_dtm timestamp,
    offer_id text,
    orgid text,
    rca_requested_dtm timestamp,
    schedule_response list<text>,
    seller_id text,
    version text,
    wpid text,
    wpid_requested_dtm timestamp,
    PRIMARY KEY ((feed_id, shard), sku_index, sku)
) WITH CLUSTERING ORDER BY (sku_index ASC, sku ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'max_threshold': '32', 'min_threshold': '4', 'cold_reads_to_omit': '0.05', 'enabled': 'true', 'unchecked_tombstone_compaction': 'false', 'tombstone_compaction_interval': '86400', 'min_sstable_size': '50', 'tombstone_threshold': '0.2', 'bucket_low': '0.5', 'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy', 'bucket_high': '1.5'}
    AND compression = {'chunk_length_kb': '64', 'crc_check_chance': '1.0', 'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.0
    AND default_time_to_live = 2592000
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.1
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE glb_partner_api_store_cass_stg0.feed_item_status_index (
    feed_id text,
    shard int,
    sku text,
    sku_index int,
    batch_id text,
    correlation_id text,
    created_dtm timestamp,
    crossref_item_id text,
    error list<text>,
    feed_submitted_dtm timestamp,
    iso_job_id text,
    istr_ map<text, text>,
    item_index text,
    item_processing_route text,
    item_processing_state text,
    item_processing_status text,
    item_processing_type text,
    mart_id text,
    modified_dtm timestamp,
    offer_id text,
    orgid text,
    rca_requested_dtm timestamp,
    seller_id text,
    solr_query text,
    version text,
    wpid text,
    wpid_requested_dtm timestamp,
    PRIMARY KEY ((feed_id, shard, sku, sku_index))
) WITH bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.0
    AND default_time_to_live = 2592000
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.1
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE glb_partner_api_store_cass_stg0.activity_old (
    id text PRIMARY KEY,
    approver_id text,
    attributes text,
    comments list<text>,
    correlation_id text,
    created_by text,
    created_dtm timestamp,
    data_error_count int,
    entity_count int,
    entity_count_processed int,
    error list<text>,
    istr_ map<text, text>,
    locale text,
    mart_id text,
    merchant_onhold_count int,
    modified_by text,
    modified_dtm timestamp,
    name text,
    org_id text,
    partner_id text,
    seller_id text,
    source text,
    status text,
    submitted_by text,
    success_count int,
    supplier_onhold_count int,
    system_error_count int,
    tenant_id text,
    timeout_error_count int,
    type text,
    vendor_id text,
    version text
) WITH bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'max_threshold': '32', 'min_threshold': '4', 'cold_reads_to_omit': '0.05', 'enabled': 'true', 'unchecked_tombstone_compaction': 'false', 'tombstone_compaction_interval': '86400', 'min_sstable_size': '50', 'tombstone_threshold': '0.2', 'bucket_low': '0.5', 'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy', 'bucket_high': '1.5'}
    AND compression = {'chunk_length_kb': '64', 'crc_check_chance': '1.0', 'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE glb_partner_api_store_cass_stg0.throttle_partner_group (
    partner_id text PRIMARY KEY,
    group_id text,
    is_active boolean,
    partner_name text
) WITH bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 0
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE glb_partner_api_store_cass_stg0.item (
    partner_id text,
    sku text,
    mart_id int,
    category text,
    channel_type text,
    created_by text,
    created_dtm timestamp,
    currency text,
    current_price text,
    error list<text>,
    feed_id text,
    feed_submitted_dtm timestamp,
    gtin text,
    ingestion_status text,
    item_id text,
    locale text,
    modified_dtm timestamp,
    offer_id text,
    org_id text,
    processing_state text,
    processing_type text,
    product_name text,
    seller_id text,
    selling_channel text,
    short_description text,
    si_number text,
    si_type text,
    spec_version text,
    subcategory text,
    updated_by text,
    vendor_contract_number text,
    vertical_id text,
    wpid text,
    PRIMARY KEY (partner_id, sku, mart_id)
) WITH CLUSTERING ORDER BY (sku ASC, mart_id ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'max_threshold': '32', 'min_threshold': '4', 'cold_reads_to_omit': '0.05', 'enabled': 'true', 'unchecked_tombstone_compaction': 'false', 'tombstone_compaction_interval': '86400', 'min_sstable_size': '50', 'tombstone_threshold': '0.2', 'bucket_low': '0.5', 'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy', 'bucket_high': '1.5'}
    AND compression = {'chunk_length_kb': '64', 'crc_check_chance': '1.0', 'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.0
    AND default_time_to_live = 2592000
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.1
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE glb_partner_api_store_cass_stg0.throttle_group_config (
    group_id text,
    operation_name text,
    input_data_size bigint,
    is_locked boolean,
    operation_alias text,
    replenish_duration int,
    replenish_tokens bigint,
    PRIMARY KEY (group_id, operation_name)
) WITH CLUSTERING ORDER BY (operation_name ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 0
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE glb_partner_api_store_cass_stg0.activity (
    activity_id text,
    cid int,
    approver_id text,
    attributes text,
    channel_type text,
    comments list<text>,
    correlation_id text,
    created_by text,
    created_dtm timestamp,
    data_error_count int,
    entity_count int,
    entity_count_processed int,
    error list<text>,
    external_user_data_error_count int,
    feed_id text,
    internal_user_data_error_count int,
    istr_ map<text, text>,
    locale text,
    mart_id text,
    merchant_onhold_count int,
    modified_by text,
    modified_dtm timestamp,
    name text,
    org_id text,
    partner_id text,
    seller_id text,
    source text,
    status text,
    submitted_by text,
    success_count int,
    supplier_id list<text>,
    supplier_onhold_count int,
    system_error_count int,
    tenant_id text,
    timeout_error_count int,
    type text,
    updated_by list<text>,
    vendor_id text,
    version text,
    PRIMARY KEY (activity_id, cid)
) WITH CLUSTERING ORDER BY (cid ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'max_threshold': '32', 'min_threshold': '4', 'cold_reads_to_omit': '0.05', 'enabled': 'true', 'unchecked_tombstone_compaction': 'false', 'tombstone_compaction_interval': '86400', 'min_sstable_size': '50', 'tombstone_threshold': '0.2', 'bucket_low': '0.5', 'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy', 'bucket_high': '1.5'}
    AND compression = {'chunk_length_kb': '64', 'crc_check_chance': '1.0', 'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE KEYSPACE gmp_payment_platform_stg WITH replication = {'class': 'SimpleStrategy', 'replication_factor': '1'}  AND durable_writes = true;

CREATE TABLE gmp_payment_platform_stg.partner_txn (
    tenant_id text,
    source text,
    partner_id text,
    shard text,
    invoice_id text,
    additional_info text,
    created_dtm timestamp,
    invoice_date timestamp,
    invoice_memo text,
    modified_dtm timestamp,
    net_payable decimal,
    status text,
    PRIMARY KEY ((tenant_id, source, partner_id, shard), invoice_id)
) WITH CLUSTERING ORDER BY (invoice_id ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE gmp_payment_platform_stg.payments_checkpoint (
    checkpoint_key text PRIMARY KEY,
    checkpoint_value text
) WITH bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE gmp_payment_platform_stg.partner_status_audit (
    partner_id text,
    created_dtm timestamp,
    deactivation_reason text,
    hold_period int,
    is_active boolean,
    last_settled text,
    settle_cycle text,
    settle_until text,
    user_id text,
    PRIMARY KEY (partner_id, created_dtm)
) WITH CLUSTERING ORDER BY (created_dtm ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE gmp_payment_platform_stg.gmp_order_commission (
    sales_order_no text,
    sales_order_line_no int,
    event_name text,
    add_ref text,
    comm_source text,
    commission_perc decimal,
    commission_proc_state text,
    commission_status text,
    contract_category text,
    created_dtm timestamp,
    error_add_info text,
    error_code text,
    error_desc text,
    error_source text,
    event_id text,
    ib_category text,
    item_charge decimal,
    item_charge_commission_amt decimal,
    item_charge_tax_amt decimal,
    item_id text,
    modified_by text,
    modified_dtm timestamp,
    offer_id text,
    order_created_dtm timestamp,
    ordered_qty int,
    orig_seller_charge decimal,
    partner_id text,
    po_line_no text,
    po_no text,
    product_type text,
    reason_code text,
    retry_count int,
    ship_charge decimal,
    ship_charge_commission_amt decimal,
    ship_charge_tax_amt decimal,
    tenant_id text,
    unit_seller_price decimal,
    unit_subsidized_price decimal,
    user_id text,
    vertical_id text,
    PRIMARY KEY (sales_order_no, sales_order_line_no, event_name)
) WITH CLUSTERING ORDER BY (sales_order_line_no ASC, event_name ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE gmp_payment_platform_stg.partner_ledger (
    partner_id text,
    epoch_day int,
    closing_balance decimal,
    gmv decimal,
    gmv_date text,
    opening_balance decimal,
    owed_until_now decimal,
    ptnr_txn_detail text,
    ptnr_txn_net_payable decimal,
    settled_until_date text,
    settled_until_now decimal,
    wired decimal,
    wired_until_now decimal,
    PRIMARY KEY (partner_id, epoch_day)
) WITH CLUSTERING ORDER BY (epoch_day DESC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'max_threshold': '32', 'min_threshold': '4', 'cold_reads_to_omit': '0.05', 'enabled': 'true', 'unchecked_tombstone_compaction': 'false', 'tombstone_compaction_interval': '86400', 'min_sstable_size': '50', 'tombstone_threshold': '0.2', 'bucket_low': '0.5', 'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy', 'bucket_high': '1.5'}
    AND compression = {'chunk_length_kb': '64', 'crc_check_chance': '1.0', 'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE gmp_payment_platform_stg.mt_payout_audit (
    tenant_id text,
    payee_id text,
    shard text,
    created_dtm timestamp,
    audit_id text,
    client_reference_id text,
    currency text,
    pay_amt decimal,
    payout_id text,
    payout_provider_status text,
    resp_code int,
    resp_description text,
    resp_payload text,
    settl_date text,
    status text,
    txn_type text,
    user_id text,
    PRIMARY KEY ((tenant_id, payee_id, shard), created_dtm)
) WITH CLUSTERING ORDER BY (created_dtm DESC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE gmp_payment_platform_stg.gmp_order_by_partner (
    partner_id text,
    event_day text,
    event_name text,
    trans_dtm timestamp,
    sales_order_no text,
    sales_order_line_no int,
    event_id text,
    sub_line_id text,
    add_ref text,
    commission_perc decimal,
    commission_proc_state text,
    commission_status text,
    contract_category text,
    created_dtm timestamp,
    ib_category text,
    item_charge decimal,
    item_charge_commission_amt decimal,
    item_charge_tax_amt decimal,
    modified_by text,
    modified_dtm timestamp,
    offer_id text,
    order_created_dtm timestamp,
    ordered_qty int,
    orig_seller_charge decimal,
    po_line_no text,
    po_no text,
    reason_code text,
    ship_charge decimal,
    ship_charge_commission_amt decimal,
    ship_charge_tax_amt decimal,
    tenant_id text,
    user_id text,
    vertical_id text,
    PRIMARY KEY ((partner_id, event_day, event_name), trans_dtm, sales_order_no, sales_order_line_no, event_id, sub_line_id)
) WITH CLUSTERING ORDER BY (trans_dtm ASC, sales_order_no ASC, sales_order_line_no ASC, event_id ASC, sub_line_id ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE gmp_payment_platform_stg.partner_status (
    partner_id text PRIMARY KEY,
    deactivation_reason text,
    hold_period int,
    is_active boolean,
    last_settled text,
    last_wired text,
    settle_cycle text,
    settle_until text
) WITH bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE gmp_payment_platform_stg.mt_gmv_daily (
    tenant_id text,
    txn_id text,
    adj_code text,
    adj_desc text,
    commission_rate decimal,
    created_dtm timestamp,
    currency text,
    customer_first_name text,
    customer_last_name text,
    customer_tender decimal,
    error text,
    gis_status text,
    item_charge_taxes decimal,
    item_id text,
    item_title text,
    item_upc text,
    modified_dtm timestamp,
    net_commission decimal,
    order_created_dtm text,
    order_line_no text,
    order_no text,
    partner_id text,
    partner_item_id text,
    partner_payable decimal,
    shipped_qty text,
    shipping_charge_taxes decimal,
    status text,
    txn_dtm text,
    txn_type text,
    PRIMARY KEY ((tenant_id, txn_id))
) WITH bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE gmp_payment_platform_stg.mt_partner_status (
    tenant_id text,
    partner_id text,
    deactivation_reason text,
    is_active boolean,
    last_settled text,
    last_wired text,
    settle_cycle text,
    PRIMARY KEY ((tenant_id, partner_id))
) WITH bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE gmp_payment_platform_stg.mt_partner_status_audit (
    tenant_id text,
    partner_id text,
    created_dtm timestamp,
    deactivation_reason text,
    is_active boolean,
    last_settled text,
    settle_cycle text,
    user_id text,
    PRIMARY KEY ((tenant_id, partner_id), created_dtm)
) WITH CLUSTERING ORDER BY (created_dtm DESC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE gmp_payment_platform_stg.gmv_daily (
    txn_id text PRIMARY KEY,
    created_dtm timestamp,
    customer_billing_state text,
    customer_first_name text,
    customer_last_name text,
    error text,
    gis_status text,
    item_id text,
    item_title text,
    modified_dtm timestamp,
    order_created_dtm text,
    order_line_no text,
    order_no text,
    partner_id text,
    partner_item_id text,
    partner_payable decimal,
    status text,
    txn_dtm text,
    txn_type text
) WITH bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE gmp_payment_platform_stg.gmp_mt_order_commission (
    tenant_id text,
    sales_order_no text,
    sales_order_line_no int,
    event_name text,
    event_id text,
    add_ref text,
    comm_source text,
    commission_perc decimal,
    commission_proc_state text,
    commission_status text,
    contract_category text,
    created_dtm timestamp,
    error_add_info text,
    error_code text,
    error_desc text,
    error_source text,
    ib_category text,
    is_default boolean,
    item_charge decimal,
    item_charge_commission decimal,
    item_charge_commission_curr text,
    item_charge_curr text,
    item_charge_qty int,
    item_charge_tax decimal,
    item_charge_tax_curr text,
    item_id text,
    modified_by text,
    modified_dtm timestamp,
    offer_id text,
    order_created_dtm timestamp,
    partner_id text,
    po_line_no text,
    po_no text,
    product_type text,
    reason_code text,
    retry_count int,
    ship_charge decimal,
    ship_charge_commission decimal,
    ship_charge_commission_curr text,
    ship_charge_curr text,
    ship_charge_qty int,
    ship_charge_tax decimal,
    ship_charge_tax_curr text,
    user_id text,
    vertical_id text,
    PRIMARY KEY ((tenant_id, sales_order_no), sales_order_line_no, event_name, event_id)
) WITH CLUSTERING ORDER BY (sales_order_line_no ASC, event_name ASC, event_id ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE gmp_payment_platform_stg.mt_partner_ledger (
    tenant_id text,
    partner_id text,
    epoch_day int,
    closing_balance decimal,
    gmv decimal,
    gmv_date text,
    opening_balance decimal,
    owed_until_now decimal,
    ptnr_txn_detail text,
    ptnr_txn_net_payable decimal,
    settled_until_now decimal,
    wired decimal,
    wired_until_now decimal,
    PRIMARY KEY ((tenant_id, partner_id), epoch_day)
) WITH CLUSTERING ORDER BY (epoch_day DESC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'max_threshold': '32', 'min_threshold': '4', 'cold_reads_to_omit': '0.05', 'enabled': 'true', 'unchecked_tombstone_compaction': 'false', 'tombstone_compaction_interval': '86400', 'min_sstable_size': '50', 'tombstone_threshold': '0.2', 'bucket_low': '0.5', 'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy', 'bucket_high': '1.5'}
    AND compression = {'chunk_length_kb': '64', 'crc_check_chance': '1.0', 'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE gmp_payment_platform_stg.partner_payout_audit (
    partner_id text,
    created_dtm timestamp,
    audit_id text,
    client_reference_id text,
    currency text,
    pay_amt decimal,
    payout_id text,
    resp_code int,
    resp_description text,
    resp_payload text,
    settl_date text,
    status text,
    txn_type text,
    user_id text,
    PRIMARY KEY (partner_id, created_dtm)
) WITH CLUSTERING ORDER BY (created_dtm ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE gmp_payment_platform_stg.mpress_ret (
    sales_order_no text,
    sales_order_line_no int,
    event_name text,
    pkg_tracking_no text,
    add_ref text,
    adj_charge decimal,
    adj_proc_state text,
    adj_status text,
    bpm_res_details text,
    created_dtm timestamp,
    error_add_info text,
    error_code text,
    error_desc text,
    error_source text,
    event_id text,
    modified_by text,
    modified_dtm timestamp,
    partner_id text,
    pkg_weight_in_lb decimal,
    retry_count int,
    return_order_no text,
    returned_qty int,
    PRIMARY KEY (sales_order_no, sales_order_line_no, event_name, pkg_tracking_no)
) WITH CLUSTERING ORDER BY (sales_order_line_no ASC, event_name ASC, pkg_tracking_no ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE gmp_payment_platform_stg.gmp_order_checkout (
    sales_order_no text,
    offer_id text,
    created_dtm timestamp,
    currency text,
    unit_orig_seller_price decimal,
    PRIMARY KEY (sales_order_no, offer_id)
) WITH CLUSTERING ORDER BY (offer_id ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE gmp_payment_platform_stg.object_store (
    object_key text PRIMARY KEY,
    object_value blob
) WITH bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'tombstone_threshold': '0.1', 'tombstone_compaction_interval': '0', 'unchecked_tombstone_compaction': 'false', 'class': 'org.apache.cassandra.db.compaction.LeveledCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.0
    AND default_time_to_live = 2592000
    AND gc_grace_seconds = 100
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.1
    AND speculative_retry = '99.0PERCENTILE';

CREATE KEYSPACE gmp_offer_attribute WITH replication = {'class': 'SimpleStrategy', 'replication_factor': '1'}  AND durable_writes = true;

CREATE TABLE gmp_offer_attribute.eligibility (
    identifier text,
    update_type text,
    created_dtm timestamp,
    eligible boolean,
    gtin text,
    item_status text,
    modified_dtm timestamp,
    offer_id text,
    offer_update_request text,
    offer_update_status text,
    product_taxcode text,
    upc text,
    PRIMARY KEY (identifier, update_type)
) WITH CLUSTERING ORDER BY (update_type ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'max_threshold': '32', 'min_threshold': '4', 'cold_reads_to_omit': '0.05', 'enabled': 'true', 'unchecked_tombstone_compaction': 'false', 'tombstone_compaction_interval': '86400', 'min_sstable_size': '50', 'tombstone_threshold': '0.2', 'bucket_low': '0.5', 'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy', 'bucket_high': '1.5'}
    AND compression = {'chunk_length_kb': '64', 'crc_check_chance': '1.0', 'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE gmp_offer_attribute.spark_job_stats (
    job_status text,
    job_submitted_date text,
    job_id text,
    spark_job_id text,
    source_id text,
    accepted_by text,
    created_date timestamp,
    data_submitted text,
    error_code text,
    error_description text,
    executed_by text,
    job_source text,
    job_submitted_timestamp timestamp,
    job_type text,
    modified_date timestamp,
    time_taken int,
    PRIMARY KEY ((job_status, job_submitted_date), job_id, spark_job_id, source_id)
) WITH CLUSTERING ORDER BY (job_id ASC, spark_job_id ASC, source_id ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.LeveledCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.0
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.1
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE gmp_offer_attribute.source_item_status (
    item_id text,
    source text,
    comments text,
    modified_dtm timestamp,
    status text,
    sub_status text,
    PRIMARY KEY (item_id, source)
) WITH CLUSTERING ORDER BY (source ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'max_threshold': '32', 'min_threshold': '4', 'cold_reads_to_omit': '0.05', 'enabled': 'true', 'unchecked_tombstone_compaction': 'false', 'tombstone_compaction_interval': '86400', 'min_sstable_size': '50', 'tombstone_threshold': '0.2', 'bucket_low': '0.5', 'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy', 'bucket_high': '1.5'}
    AND compression = {'chunk_length_kb': '64', 'crc_check_chance': '1.0', 'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE gmp_offer_attribute.offer_attribute (
    offer_id text,
    vertical_id int,
    ca_flag int,
    created_dtm timestamp,
    gh_flag int,
    hayneedle_flag int,
    hayneedle_state int,
    jet_flag int,
    jet_state text,
    mart_id int,
    modified_by text,
    modified_dtm timestamp,
    product_id text,
    seller_id text,
    PRIMARY KEY (offer_id, vertical_id)
) WITH CLUSTERING ORDER BY (vertical_id ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"100"}'
    AND comment = ''
    AND compaction = {'max_threshold': '32', 'min_threshold': '4', 'cold_reads_to_omit': '0.05', 'enabled': 'true', 'unchecked_tombstone_compaction': 'false', 'tombstone_compaction_interval': '86400', 'min_sstable_size': '50', 'tombstone_threshold': '0.2', 'bucket_low': '0.5', 'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy', 'bucket_high': '1.5'}
    AND compression = {'chunk_length_kb': '64', 'crc_check_chance': '1.0', 'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE KEYSPACE glb_partner_api_inv_cass_stg0 WITH replication = {'class': 'SimpleStrategy', 'replication_factor': '1'}  AND durable_writes = true;

CREATE TABLE glb_partner_api_inv_cass_stg0.txn_trail (
    id text,
    txn_type text,
    ts_unique_id text,
    value text,
    PRIMARY KEY (id, txn_type, ts_unique_id)
) WITH CLUSTERING ORDER BY (txn_type ASC, ts_unique_id ASC)
    AND bloom_filter_fp_chance = 0.1
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.LeveledCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE glb_partner_api_inv_cass_stg0.item_inventory_status (
    primary_key text PRIMARY KEY,
    created_dtm timestamp,
    error text,
    ims_update_inventory_request text,
    ims_update_inventory_response text,
    ims_update_ship_node_defn_request text,
    ims_update_ship_node_defn_response text,
    partner_id text,
    request text,
    response text,
    sku text,
    solr_query text,
    status text
) WITH bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.LeveledCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.0
    AND default_time_to_live = 60
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.1
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE glb_partner_api_inv_cass_stg0.inventory_item_status (
    primary_key text PRIMARY KEY,
    batch_id text,
    created_dtm timestamp,
    error list<text>,
    feed_id text,
    ims_update_inventory_request text,
    ims_update_inventory_response text,
    ims_update_ship_node_defn_request text,
    ims_update_ship_node_defn_response text,
    iqs_query_offer_request text,
    iqs_query_offer_response text,
    item_index text,
    item_payload text,
    item_state text,
    item_status text,
    modified_dtm timestamp,
    partner_id text,
    request text,
    response text,
    sku text,
    solr_query text
) WITH bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.LeveledCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.0
    AND default_time_to_live = 2592000
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.1
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE glb_partner_api_inv_cass_stg0.feedstatus (
    feed_id text PRIMARY KEY,
    app_ map<text, text>,
    batch_id text,
    correlation_id text,
    created_by text,
    created_dtm timestamp,
    data_error_count int,
    entity_count text,
    entity_count_processed int,
    error list<text>,
    error_code text,
    error_message text,
    feed_source text,
    feed_status text,
    feed_submitted_dtm timestamp,
    feed_type text,
    file_name text,
    is_gmp_partner boolean,
    istr_ map<text, text>,
    locale text,
    mart_id text,
    modified_by text,
    modified_dtm timestamp,
    org_id text,
    partner_id text,
    seller_id text,
    solr_query text,
    success_count int,
    system_error_count int,
    tenant_id text,
    timeout_error_count int,
    transaction_id text,
    version text
) WITH bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE glb_partner_api_inv_cass_stg0.feed_item_status (
    feed_id text,
    shard int,
    sku_index int,
    sku text,
    batch_id text,
    correlation_id text,
    created_dtm timestamp,
    crossref_item_id text,
    error list<text>,
    feed_submitted_dtm timestamp,
    ids_ map<text, text>,
    ingestion_status text,
    iso_job_id text,
    istr_ map<text, text>,
    item_index text,
    item_processing_internal_route text,
    item_processing_internal_state text,
    item_processing_route text,
    item_processing_state text,
    item_processing_status text,
    item_processing_type text,
    mart_id text,
    modified_dtm timestamp,
    offer_id text,
    orgid text,
    rca_requested_dtm timestamp,
    schedule_response list<text>,
    seller_id text,
    version text,
    wpid text,
    wpid_requested_dtm timestamp,
    PRIMARY KEY ((feed_id, shard), sku_index, sku)
) WITH CLUSTERING ORDER BY (sku_index ASC, sku ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'max_threshold': '32', 'min_threshold': '4', 'cold_reads_to_omit': '0.05', 'enabled': 'true', 'unchecked_tombstone_compaction': 'false', 'tombstone_compaction_interval': '86400', 'min_sstable_size': '50', 'tombstone_threshold': '0.2', 'bucket_low': '0.5', 'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy', 'bucket_high': '1.5'}
    AND compression = {'chunk_length_kb': '64', 'crc_check_chance': '1.0', 'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.0
    AND default_time_to_live = 2592000
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.1
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE glb_partner_api_inv_cass_stg0.feed_item_status_index (
    feed_id text,
    shard int,
    sku text,
    sku_index int,
    batch_id text,
    correlation_id text,
    created_dtm timestamp,
    crossref_item_id text,
    error list<text>,
    feed_submitted_dtm timestamp,
    iso_job_id text,
    istr_ map<text, text>,
    item_index text,
    item_processing_route text,
    item_processing_state text,
    item_processing_status text,
    item_processing_type text,
    mart_id text,
    modified_dtm timestamp,
    offer_id text,
    orgid text,
    rca_requested_dtm timestamp,
    seller_id text,
    solr_query text,
    version text,
    wpid text,
    wpid_requested_dtm timestamp,
    PRIMARY KEY ((feed_id, shard, sku, sku_index))
) WITH bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.0
    AND default_time_to_live = 2592000
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.1
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE glb_partner_api_inv_cass_stg0.item (
    partner_id text,
    sku text,
    mart_id int,
    category text,
    channel_type text,
    created_by text,
    created_dtm timestamp,
    currency text,
    current_price text,
    error list<text>,
    feed_id text,
    feed_submitted_dtm timestamp,
    gtin text,
    ingestion_status text,
    item_id text,
    locale text,
    modified_dtm timestamp,
    offer_id text,
    org_id text,
    processing_state text,
    processing_type text,
    product_name text,
    seller_id text,
    selling_channel text,
    short_description text,
    si_number text,
    si_type text,
    spec_version text,
    subcategory text,
    updated_by text,
    vendor_contract_number text,
    vertical_id text,
    wpid text,
    PRIMARY KEY (partner_id, sku, mart_id)
) WITH CLUSTERING ORDER BY (sku ASC, mart_id ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'max_threshold': '32', 'min_threshold': '4', 'cold_reads_to_omit': '0.05', 'enabled': 'true', 'unchecked_tombstone_compaction': 'false', 'tombstone_compaction_interval': '86400', 'min_sstable_size': '50', 'tombstone_threshold': '0.2', 'bucket_low': '0.5', 'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy', 'bucket_high': '1.5'}
    AND compression = {'chunk_length_kb': '64', 'crc_check_chance': '1.0', 'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.0
    AND default_time_to_live = 2592000
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.1
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE glb_partner_api_inv_cass_stg0.users_sasi (
    userid text PRIMARY KEY,
    first_name text,
    last_name text
) WITH bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 300
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE glb_partner_api_inv_cass_stg0.inventory_feeditem_status (
    feed_id text,
    sku text,
    item_index text,
    batch_id text,
    created_dtm timestamp,
    error list<text>,
    ims_update_inventory_request text,
    ims_update_inventory_response text,
    ims_update_ship_node_defn_request text,
    ims_update_ship_node_defn_response text,
    iqs_query_offer_request text,
    iqs_query_offer_response text,
    item_payload text,
    item_state text,
    item_status text,
    modified_dtm timestamp,
    partner_id text,
    request text,
    response text,
    solr_query text,
    PRIMARY KEY (feed_id, sku, item_index)
) WITH CLUSTERING ORDER BY (sku ASC, item_index ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.LeveledCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.0
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.1
    AND speculative_retry = '99.0PERCENTILE';

CREATE KEYSPACE mp_payment_reporting_system WITH replication = {'class': 'SimpleStrategy', 'replication_factor': '1'}  AND durable_writes = true;

CREATE TABLE mp_payment_reporting_system.mp_weekly_invoice_audit (
    partner_id text,
    invoice_date timestamp,
    activity text,
    activity_date timestamp,
    user text,
    PRIMARY KEY (partner_id, invoice_date, activity, activity_date, user)
) WITH CLUSTERING ORDER BY (invoice_date DESC, activity ASC, activity_date DESC, user ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE mp_payment_reporting_system.mp_weekly_invoice_details (
    partner_id text,
    invoice_date timestamp,
    shard int,
    client_order_no text,
    client_order_line_no int,
    trans_type text,
    adjsmnt_code text,
    adjsmnt_desc text,
    commission_amt decimal,
    cust_first_name text,
    cust_last_name text,
    item_name text,
    order_create_date timestamp,
    seller_item_no text,
    seller_pay_amt decimal,
    ship_date timestamp,
    shipped_qty int,
    total_amt decimal,
    PRIMARY KEY ((partner_id, invoice_date, shard), client_order_no, client_order_line_no, trans_type)
) WITH CLUSTERING ORDER BY (client_order_no ASC, client_order_line_no ASC, trans_type ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE mp_payment_reporting_system.mp_weekly_invoice (
    partner_id text,
    invoice_date timestamp,
    count int,
    email_status text,
    status text,
    PRIMARY KEY (partner_id, invoice_date)
) WITH CLUSTERING ORDER BY (invoice_date DESC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE mp_payment_reporting_system.mp_weekly_invoice_file (
    invoice_date timestamp,
    file_name text,
    file_load_date timestamp,
    status text,
    PRIMARY KEY (invoice_date, file_name)
) WITH CLUSTERING ORDER BY (file_name ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE KEYSPACE glb_partner_api_orders_stg0 WITH replication = {'class': 'SimpleStrategy', 'replication_factor': '1'}  AND durable_writes = true;

CREATE TABLE glb_partner_api_orders_stg0.bedrock_order_release (
    primary_key text PRIMARY KEY,
    created_dtm timestamp,
    modified_dtm timestamp,
    order_data text,
    order_status text,
    partner_id text,
    solr_query text
) WITH bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'sstable_size_in_mb': '160', 'enabled': 'true', 'unchecked_tombstone_compaction': 'false', 'tombstone_compaction_interval': '86400', 'tombstone_threshold': '0.2', 'class': 'org.apache.cassandra.db.compaction.LeveledCompactionStrategy'}
    AND compression = {'chunk_length_kb': '64', 'crc_check_chance': '1.0', 'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.0
    AND default_time_to_live = 15552000
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.1
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE glb_partner_api_orders_stg0.txn_trail (
    id text,
    txn_type text,
    ts_unique_id text,
    value text,
    PRIMARY KEY (id, txn_type, ts_unique_id)
) WITH CLUSTERING ORDER BY (txn_type ASC, ts_unique_id ASC)
    AND bloom_filter_fp_chance = 0.1
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = 'glb_partner_api_orders_stg0'
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.LeveledCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE glb_partner_api_orders_stg0.order_audit_new (
    purchase_order_no text,
    status text,
    apiname text,
    created_dtm timestamp,
    channel_type text,
    compute_address text,
    consumer_id text,
    error text,
    error_code text,
    http_code text,
    modified_dtm timestamp,
    partner_id text,
    sales_order_no text,
    seller_id text,
    solr_query text,
    transaction_id text,
    PRIMARY KEY (purchase_order_no, status, apiname, created_dtm)
) WITH CLUSTERING ORDER BY (status ASC, apiname ASC, created_dtm ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.LeveledCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.0
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.1
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE glb_partner_api_orders_stg0.order_req_count (
    partnerid text PRIMARY KEY,
    count int
) WITH bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE KEYSPACE glb_partner_api_storage_stg0 WITH replication = {'class': 'SimpleStrategy', 'replication_factor': '1'}  AND durable_writes = true;

CREATE TABLE glb_partner_api_storage_stg0.object_store (
    object_key text PRIMARY KEY,
    object_value blob
) WITH bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.LeveledCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.0
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.1
    AND speculative_retry = '99.0PERCENTILE';

CREATE KEYSPACE hyperloop WITH replication = {'class': 'SimpleStrategy', 'replication_factor': '1'}  AND durable_writes = true;

CREATE KEYSPACE gmp_payment_platform_pqa WITH replication = {'class': 'SimpleStrategy', 'replication_factor': '1'}  AND durable_writes = true;

CREATE TABLE gmp_payment_platform_pqa.partner_txn (
    tenant_id text,
    source text,
    partner_id text,
    shard text,
    invoice_id text,
    additional_info text,
    created_dtm timestamp,
    invoice_date timestamp,
    invoice_memo text,
    modified_dtm timestamp,
    net_payable decimal,
    status text,
    PRIMARY KEY ((tenant_id, source, partner_id, shard), invoice_id)
) WITH CLUSTERING ORDER BY (invoice_id ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE gmp_payment_platform_pqa.payments_checkpoint (
    checkpoint_key text PRIMARY KEY,
    checkpoint_value text
) WITH bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE gmp_payment_platform_pqa.partner_status_audit (
    partner_id text,
    created_dtm timestamp,
    deactivation_reason text,
    hold_period int,
    is_active boolean,
    last_settled text,
    settle_cycle text,
    settle_until text,
    user_id text,
    PRIMARY KEY (partner_id, created_dtm)
) WITH CLUSTERING ORDER BY (created_dtm ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE gmp_payment_platform_pqa.gmp_order_commission (
    sales_order_no text,
    sales_order_line_no int,
    event_name text,
    add_ref text,
    comm_source text,
    commission_perc decimal,
    commission_proc_state text,
    commission_status text,
    contract_category text,
    created_dtm timestamp,
    error_add_info text,
    error_code text,
    error_desc text,
    error_source text,
    event_id text,
    ib_category text,
    item_charge decimal,
    item_charge_commission_amt decimal,
    item_charge_tax_amt decimal,
    item_id text,
    modified_by text,
    modified_dtm timestamp,
    offer_id text,
    order_created_dtm timestamp,
    ordered_qty int,
    orig_seller_charge decimal,
    partner_id text,
    po_line_no text,
    po_no text,
    product_type text,
    reason_code text,
    retry_count int,
    ship_charge decimal,
    ship_charge_commission_amt decimal,
    ship_charge_tax_amt decimal,
    tenant_id text,
    unit_seller_price decimal,
    unit_subsidized_price decimal,
    user_id text,
    vertical_id text,
    PRIMARY KEY (sales_order_no, sales_order_line_no, event_name)
) WITH CLUSTERING ORDER BY (sales_order_line_no ASC, event_name ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE gmp_payment_platform_pqa.partner_ledger (
    partner_id text,
    epoch_day int,
    closing_balance decimal,
    gmv decimal,
    gmv_date text,
    opening_balance decimal,
    owed_until_now decimal,
    ptnr_txn_detail text,
    ptnr_txn_net_payable decimal,
    settled_until_date text,
    settled_until_now decimal,
    wired decimal,
    wired_until_now decimal,
    PRIMARY KEY (partner_id, epoch_day)
) WITH CLUSTERING ORDER BY (epoch_day DESC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'max_threshold': '32', 'min_threshold': '4', 'cold_reads_to_omit': '0.05', 'enabled': 'true', 'unchecked_tombstone_compaction': 'false', 'tombstone_compaction_interval': '86400', 'min_sstable_size': '50', 'tombstone_threshold': '0.2', 'bucket_low': '0.5', 'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy', 'bucket_high': '1.5'}
    AND compression = {'chunk_length_kb': '64', 'crc_check_chance': '1.0', 'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE gmp_payment_platform_pqa.mt_payout_audit (
    tenant_id text,
    payee_id text,
    shard text,
    created_dtm timestamp,
    audit_id text,
    client_reference_id text,
    currency text,
    pay_amt decimal,
    payout_id text,
    payout_provider_status text,
    resp_code int,
    resp_description text,
    resp_payload text,
    settl_date text,
    status text,
    txn_type text,
    user_id text,
    PRIMARY KEY ((tenant_id, payee_id, shard), created_dtm)
) WITH CLUSTERING ORDER BY (created_dtm DESC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE gmp_payment_platform_pqa.gmp_order_by_partner (
    partner_id text,
    event_day text,
    event_name text,
    trans_dtm timestamp,
    sales_order_no text,
    sales_order_line_no int,
    event_id text,
    sub_line_id text,
    add_ref text,
    commission_perc decimal,
    commission_proc_state text,
    commission_status text,
    contract_category text,
    created_dtm timestamp,
    ib_category text,
    item_charge decimal,
    item_charge_commission_amt decimal,
    item_charge_tax_amt decimal,
    modified_by text,
    modified_dtm timestamp,
    offer_id text,
    order_created_dtm timestamp,
    ordered_qty int,
    orig_seller_charge decimal,
    po_line_no text,
    po_no text,
    reason_code text,
    ship_charge decimal,
    ship_charge_commission_amt decimal,
    ship_charge_tax_amt decimal,
    tenant_id text,
    user_id text,
    vertical_id text,
    PRIMARY KEY ((partner_id, event_day, event_name), trans_dtm, sales_order_no, sales_order_line_no, event_id, sub_line_id)
) WITH CLUSTERING ORDER BY (trans_dtm ASC, sales_order_no ASC, sales_order_line_no ASC, event_id ASC, sub_line_id ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE gmp_payment_platform_pqa.partner_status (
    partner_id text PRIMARY KEY,
    deactivation_reason text,
    hold_period int,
    is_active boolean,
    last_settled text,
    last_wired text,
    settle_cycle text,
    settle_until text
) WITH bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE gmp_payment_platform_pqa.mt_gmv_daily (
    tenant_id text,
    txn_id text,
    adj_code text,
    adj_desc text,
    commission_rate decimal,
    created_dtm timestamp,
    currency text,
    customer_first_name text,
    customer_last_name text,
    customer_tender decimal,
    error text,
    gis_status text,
    item_charge_taxes decimal,
    item_id text,
    item_title text,
    item_upc text,
    modified_dtm timestamp,
    net_commission decimal,
    order_created_dtm text,
    order_line_no text,
    order_no text,
    partner_id text,
    partner_item_id text,
    partner_payable decimal,
    shipped_qty text,
    shipping_charge_taxes decimal,
    status text,
    txn_dtm text,
    txn_type text,
    PRIMARY KEY ((tenant_id, txn_id))
) WITH bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE gmp_payment_platform_pqa.mt_partner_status (
    tenant_id text,
    partner_id text,
    deactivation_reason text,
    is_active boolean,
    last_settled text,
    last_wired text,
    settle_cycle text,
    PRIMARY KEY ((tenant_id, partner_id))
) WITH bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE gmp_payment_platform_pqa.mt_partner_status_audit (
    tenant_id text,
    partner_id text,
    created_dtm timestamp,
    deactivation_reason text,
    is_active boolean,
    last_settled text,
    settle_cycle text,
    user_id text,
    PRIMARY KEY ((tenant_id, partner_id), created_dtm)
) WITH CLUSTERING ORDER BY (created_dtm DESC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE gmp_payment_platform_pqa.gmv_daily (
    txn_id text PRIMARY KEY,
    created_dtm timestamp,
    customer_billing_state text,
    customer_first_name text,
    customer_last_name text,
    error text,
    gis_status text,
    item_id text,
    item_title text,
    modified_dtm timestamp,
    order_created_dtm text,
    order_line_no text,
    order_no text,
    partner_id text,
    partner_item_id text,
    partner_payable decimal,
    status text,
    txn_dtm text,
    txn_type text
) WITH bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE gmp_payment_platform_pqa.gmp_mt_order_commission (
    tenant_id text,
    sales_order_no text,
    sales_order_line_no int,
    event_name text,
    event_id text,
    add_ref text,
    comm_source text,
    commission_perc decimal,
    commission_proc_state text,
    commission_status text,
    contract_category text,
    created_dtm timestamp,
    error_add_info text,
    error_code text,
    error_desc text,
    error_source text,
    ib_category text,
    is_default boolean,
    item_charge decimal,
    item_charge_commission decimal,
    item_charge_commission_curr text,
    item_charge_curr text,
    item_charge_qty int,
    item_charge_tax decimal,
    item_charge_tax_curr text,
    item_id text,
    modified_by text,
    modified_dtm timestamp,
    offer_id text,
    order_created_dtm timestamp,
    partner_id text,
    po_line_no text,
    po_no text,
    product_type text,
    reason_code text,
    retry_count int,
    ship_charge decimal,
    ship_charge_commission decimal,
    ship_charge_commission_curr text,
    ship_charge_curr text,
    ship_charge_qty int,
    ship_charge_tax decimal,
    ship_charge_tax_curr text,
    user_id text,
    vertical_id text,
    PRIMARY KEY ((tenant_id, sales_order_no), sales_order_line_no, event_name, event_id)
) WITH CLUSTERING ORDER BY (sales_order_line_no ASC, event_name ASC, event_id ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE gmp_payment_platform_pqa.mt_partner_ledger (
    tenant_id text,
    partner_id text,
    epoch_day int,
    closing_balance decimal,
    gmv decimal,
    gmv_date text,
    opening_balance decimal,
    owed_until_now decimal,
    ptnr_txn_detail text,
    ptnr_txn_net_payable decimal,
    settled_until_now decimal,
    wired decimal,
    wired_until_now decimal,
    PRIMARY KEY ((tenant_id, partner_id), epoch_day)
) WITH CLUSTERING ORDER BY (epoch_day DESC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'max_threshold': '32', 'min_threshold': '4', 'cold_reads_to_omit': '0.05', 'enabled': 'true', 'unchecked_tombstone_compaction': 'false', 'tombstone_compaction_interval': '86400', 'min_sstable_size': '50', 'tombstone_threshold': '0.2', 'bucket_low': '0.5', 'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy', 'bucket_high': '1.5'}
    AND compression = {'chunk_length_kb': '64', 'crc_check_chance': '1.0', 'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE gmp_payment_platform_pqa.partner_payout_audit (
    partner_id text,
    created_dtm timestamp,
    audit_id text,
    client_reference_id text,
    currency text,
    pay_amt decimal,
    payout_id text,
    resp_code int,
    resp_description text,
    resp_payload text,
    settl_date text,
    status text,
    txn_type text,
    user_id text,
    PRIMARY KEY (partner_id, created_dtm)
) WITH CLUSTERING ORDER BY (created_dtm ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE gmp_payment_platform_pqa.mpress_ret (
    sales_order_no text,
    sales_order_line_no int,
    event_name text,
    pkg_tracking_no text,
    add_ref text,
    adj_charge decimal,
    adj_proc_state text,
    adj_status text,
    bpm_res_details text,
    created_dtm timestamp,
    error_add_info text,
    error_code text,
    error_desc text,
    error_source text,
    event_id text,
    modified_by text,
    modified_dtm timestamp,
    partner_id text,
    pkg_weight_in_lb decimal,
    retry_count int,
    return_order_no text,
    returned_qty int,
    PRIMARY KEY (sales_order_no, sales_order_line_no, event_name, pkg_tracking_no)
) WITH CLUSTERING ORDER BY (sales_order_line_no ASC, event_name ASC, pkg_tracking_no ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE gmp_payment_platform_pqa.gmp_order_checkout (
    sales_order_no text,
    offer_id text,
    created_dtm timestamp,
    currency text,
    unit_orig_seller_price decimal,
    PRIMARY KEY (sales_order_no, offer_id)
) WITH CLUSTERING ORDER BY (offer_id ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE gmp_payment_platform_pqa.object_store (
    object_key text PRIMARY KEY,
    object_value blob
) WITH bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'tombstone_threshold': '0.1', 'tombstone_compaction_interval': '0', 'unchecked_tombstone_compaction': 'false', 'class': 'org.apache.cassandra.db.compaction.LeveledCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.0
    AND default_time_to_live = 2592000
    AND gc_grace_seconds = 100
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.1
    AND speculative_retry = '99.0PERCENTILE';

CREATE KEYSPACE external_integration WITH replication = {'class': 'SimpleStrategy', 'replication_factor': '1'}  AND durable_writes = true;

CREATE TABLE external_integration.lookups (
    tenant text,
    xref_id text,
    bucket_id timestamp,
    event_id text,
    event_time timestamp,
    l_m timestamp,
    payload text,
    shard int,
    PRIMARY KEY ((tenant, xref_id))
) WITH bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE external_integration.events_new (
    bucket_id timestamp,
    shard int,
    event_time timestamp,
    id text,
    error text,
    payload text,
    processed_at timestamp,
    status text,
    tenant text,
    xref_id text,
    PRIMARY KEY ((bucket_id, shard), event_time, id)
) WITH CLUSTERING ORDER BY (event_time ASC, id ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE external_integration.event_buckets (
    id timestamp PRIMARY KEY,
    count bigint,
    last_updated_at timestamp,
    processed_at timestamp,
    status text
) WITH bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"NONE", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE external_integration.buckets (
    id timestamp PRIMARY KEY,
    count bigint,
    failed_shards text,
    modified_at timestamp,
    processed_at timestamp,
    status text
) WITH bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE external_integration.kv_table (
    key text,
    column text,
    l_m timestamp,
    value text,
    PRIMARY KEY (key, column)
) WITH CLUSTERING ORDER BY (column ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE external_integration.events (
    bucket_id timestamp,
    shard int,
    event_time timestamp,
    event_id text,
    created_at timestamp,
    error text,
    modified_at timestamp,
    processed_at timestamp,
    status text,
    tenant text,
    xref_id text,
    PRIMARY KEY ((bucket_id, shard), event_time, event_id)
) WITH CLUSTERING ORDER BY (event_time ASC, event_id ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"NONE", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE external_integration.event_lookup (
    tenant text,
    xref_id text,
    bucket_id timestamp,
    created_at timestamp,
    event_id text,
    event_time timestamp,
    modified_at timestamp,
    payload text,
    shard int,
    PRIMARY KEY ((tenant, xref_id))
) WITH bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"NONE", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE external_integration.eventbatch (
    batch_id uuid,
    sku text,
    event_type text,
    created_by text,
    created_date timestamp,
    modified_by text,
    modified_date timestamp,
    seller_id text,
    shard int,
    tenant text,
    tenant1 text,
    uber_payload text,
    PRIMARY KEY (batch_id, sku, event_type)
) WITH CLUSTERING ORDER BY (sku ASC, event_type ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.LeveledCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.0
    AND default_time_to_live = 2592000
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.1
    AND speculative_retry = '99.0PERCENTILE';

CREATE KEYSPACE fgw_ingester_migration_cass WITH replication = {'class': 'SimpleStrategy', 'replication_factor': '1'}  AND durable_writes = true;

CREATE TABLE fgw_ingester_migration_cass.item_shards (
    feed_id text,
    sku text,
    sku_index int,
    shard int,
    PRIMARY KEY (feed_id, sku, sku_index)
) WITH CLUSTERING ORDER BY (sku ASC, sku_index ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE fgw_ingester_migration_cass.txn_trail (
    id text,
    txn_type text,
    ts_unique_id text,
    value text,
    PRIMARY KEY (id, txn_type, ts_unique_id)
) WITH CLUSTERING ORDER BY (txn_type DESC, ts_unique_id DESC)
    AND bloom_filter_fp_chance = 0.1
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'sstable_size_in_mb': '160', 'enabled': 'true', 'unchecked_tombstone_compaction': 'false', 'tombstone_compaction_interval': '86400', 'tombstone_threshold': '0.2', 'class': 'org.apache.cassandra.db.compaction.LeveledCompactionStrategy'}
    AND compression = {'chunk_length_kb': '64', 'crc_check_chance': '1.0', 'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE fgw_ingester_migration_cass.feedstatus (
    feed_id text PRIMARY KEY,
    app_ map<text, text>,
    batch_id text,
    correlation_id text,
    created_by text,
    created_dtm timestamp,
    data_error_count int,
    entity_count text,
    entity_count_processed int,
    error list<text>,
    error_code text,
    error_message text,
    feed_source text,
    feed_status text,
    feed_submitted_dtm timestamp,
    feed_type text,
    file_name text,
    is_gmp_partner boolean,
    istr_ map<text, text>,
    locale text,
    mart_id text,
    modified_by text,
    modified_dtm timestamp,
    org_id text,
    partner_id text,
    seller_id text,
    solr_query text,
    success_count int,
    system_error_count int,
    tenant_id text,
    timeout_error_count int,
    transaction_id text,
    version text
) WITH bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.LeveledCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.0
    AND default_time_to_live = 2592000
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.1
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE fgw_ingester_migration_cass.feeditemstatus (
    feed_id text,
    sku text,
    app_ map<text, text>,
    batch_id text,
    client_dialog list<text>,
    correlation_id text,
    created_dtm timestamp,
    crossref_item_id text,
    error list<text>,
    feed_submitted_dtm timestamp,
    iso_job_id text,
    iso_request text,
    iso_response text,
    istr_ map<text, text>,
    item_index text,
    item_payload text,
    item_processing_route text,
    item_processing_state text,
    item_processing_status text,
    item_processing_type text,
    mart_id text,
    modified_dtm timestamp,
    offer_id text,
    orgid text,
    qarth_request text,
    qarth_response text,
    rca_requested_dtm timestamp,
    schedule_response list<text>,
    seller_id text,
    solr_query text,
    version text,
    wpid text,
    wpid_requested_dtm timestamp,
    PRIMARY KEY (feed_id, sku)
) WITH CLUSTERING ORDER BY (sku ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.LeveledCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.0
    AND default_time_to_live = 2592000
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.1
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE fgw_ingester_migration_cass.feed_item_status (
    feed_id text,
    shard int,
    sku_index int,
    sku text,
    batch_id text,
    correlation_id text,
    created_dtm timestamp,
    crossref_item_id text,
    error list<text>,
    feed_submitted_dtm timestamp,
    ids_ map<text, text>,
    ingestion_status text,
    iso_job_id text,
    istr_ map<text, text>,
    item_index text,
    item_processing_internal_route text,
    item_processing_internal_state text,
    item_processing_route text,
    item_processing_state text,
    item_processing_status text,
    item_processing_type text,
    mart_id text,
    modified_dtm timestamp,
    offer_id text,
    orgid text,
    rca_requested_dtm timestamp,
    schedule_response list<text>,
    seller_id text,
    version text,
    wpid text,
    wpid_requested_dtm timestamp,
    PRIMARY KEY ((feed_id, shard), sku_index, sku)
) WITH CLUSTERING ORDER BY (sku_index ASC, sku ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'max_threshold': '32', 'min_threshold': '4', 'cold_reads_to_omit': '0.05', 'enabled': 'true', 'unchecked_tombstone_compaction': 'false', 'tombstone_compaction_interval': '86400', 'min_sstable_size': '50', 'tombstone_threshold': '0.2', 'bucket_low': '0.5', 'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy', 'bucket_high': '1.5'}
    AND compression = {'chunk_length_kb': '64', 'crc_check_chance': '1.0', 'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.0
    AND default_time_to_live = 2592000
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.1
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE fgw_ingester_migration_cass.feed_item_status_index (
    feed_id text,
    shard int,
    sku text,
    sku_index int,
    batch_id text,
    correlation_id text,
    created_dtm timestamp,
    crossref_item_id text,
    error list<text>,
    feed_submitted_dtm timestamp,
    iso_job_id text,
    istr_ map<text, text>,
    item_index text,
    item_processing_route text,
    item_processing_state text,
    item_processing_status text,
    item_processing_type text,
    mart_id text,
    modified_dtm timestamp,
    offer_id text,
    orgid text,
    rca_requested_dtm timestamp,
    seller_id text,
    solr_query text,
    version text,
    wpid text,
    wpid_requested_dtm timestamp,
    PRIMARY KEY ((feed_id, shard, sku, sku_index))
) WITH bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.0
    AND default_time_to_live = 2592000
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.1
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE fgw_ingester_migration_cass.item (
    partner_id text,
    sku text,
    mart_id int,
    category text,
    channel_type text,
    created_by text,
    created_dtm timestamp,
    currency text,
    current_price text,
    error list<text>,
    feed_id text,
    feed_submitted_dtm timestamp,
    gtin text,
    ingestion_status text,
    item_id text,
    locale text,
    modified_dtm timestamp,
    offer_id text,
    org_id text,
    processing_state text,
    processing_type text,
    product_name text,
    seller_id text,
    selling_channel text,
    short_description text,
    si_number text,
    si_type text,
    spec_version text,
    subcategory text,
    updated_by text,
    vendor_contract_number text,
    vertical_id text,
    wpid text,
    PRIMARY KEY (partner_id, sku, mart_id)
) WITH CLUSTERING ORDER BY (sku ASC, mart_id ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'max_threshold': '32', 'min_threshold': '4', 'cold_reads_to_omit': '0.05', 'enabled': 'true', 'unchecked_tombstone_compaction': 'false', 'tombstone_compaction_interval': '86400', 'min_sstable_size': '50', 'tombstone_threshold': '0.2', 'bucket_low': '0.5', 'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy', 'bucket_high': '1.5'}
    AND compression = {'chunk_length_kb': '64', 'crc_check_chance': '1.0', 'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.0
    AND default_time_to_live = 2592000
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.1
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE fgw_ingester_migration_cass.item_shards_copy (
    feed_id text,
    sku text,
    sku_index int,
    shard int,
    PRIMARY KEY (feed_id, sku, sku_index)
) WITH CLUSTERING ORDER BY (sku ASC, sku_index ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE KEYSPACE uhura WITH replication = {'class': 'SimpleStrategy', 'replication_factor': '1'}  AND durable_writes = true;

CREATE TABLE uhura.resource_store (
    resource_name text,
    insertion_timestamp timeuuid,
    binary_content blob,
    checksum text,
    created_by text,
    created_date timestamp,
    file_name text,
    modified_by text,
    modified_date timestamp,
    reference_1 text,
    string_content text,
    tags set<text>,
    PRIMARY KEY (resource_name, insertion_timestamp)
) WITH CLUSTERING ORDER BY (insertion_timestamp DESC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.LeveledCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.0
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.1
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE uhura.templates (
    template_name text,
    insertion_signature timeuuid,
    checksum text,
    created_by text,
    created_date timestamp,
    modified_by text,
    modified_date timestamp,
    template_content text,
    PRIMARY KEY (template_name, insertion_signature)
) WITH CLUSTERING ORDER BY (insertion_signature DESC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.LeveledCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.0
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.1
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE uhura.row_storage (
    date_key text,
    row_id bigint,
    record text,
    PRIMARY KEY (date_key, row_id)
) WITH CLUSTERING ORDER BY (row_id ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE uhura.resource_namespace_store (
    namespace text,
    name text,
    version text,
    binary_content blob,
    created_by text,
    created_date timestamp,
    modified_by text,
    modified_date timestamp,
    status text,
    tags set<text>,
    PRIMARY KEY ((namespace, name, version))
) WITH bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.LeveledCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.0
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.1
    AND speculative_retry = '99.0PERCENTILE';
CREATE INDEX resource_namespace_store_index_2 ON uhura.resource_namespace_store (namespace);
CREATE INDEX resource_namespace_store_index_1 ON uhura.resource_namespace_store (name);

CREATE TABLE uhura.index_storage (
    date_key text,
    index_dv text,
    seconds_in_day int,
    job_id text,
    serialized_bitmap text,
    PRIMARY KEY ((date_key, index_dv), seconds_in_day, job_id)
) WITH CLUSTERING ORDER BY (seconds_in_day ASC, job_id ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE uhura.notifications_consumer_offsets (
    datasource text,
    consumer_id uuid,
    offset text,
    PRIMARY KEY (datasource, consumer_id)
) WITH CLUSTERING ORDER BY (consumer_id ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE uhura.templates_1 (
    template_name text,
    insertion_signature timeuuid,
    checksum text,
    created_by text,
    created_date timestamp,
    modified_by text,
    modified_date timestamp,
    template_content text,
    PRIMARY KEY (template_name, insertion_signature)
) WITH CLUSTERING ORDER BY (insertion_signature DESC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.LeveledCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.0
    AND default_time_to_live = 2592000
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.1
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE uhura.job_event_listeners (
    appname text,
    jobid uuid,
    eventtype text,
    listener text,
    PRIMARY KEY ((appname, jobid), eventtype, listener)
) WITH CLUSTERING ORDER BY (eventtype ASC, listener ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE uhura.job_task_status (
    appname text,
    jobid uuid,
    taskname text,
    status text,
    PRIMARY KEY ((appname, jobid), taskname)
) WITH CLUSTERING ORDER BY (taskname ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE uhura.job_task_comments (
    appname text,
    jobid uuid,
    taskname text,
    recordedtime timestamp,
    comment text,
    PRIMARY KEY ((appname, jobid), taskname, recordedtime, comment)
) WITH CLUSTERING ORDER BY (taskname ASC, recordedtime ASC, comment ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE uhura.sequencer (
    date_key text PRIMARY KEY,
    current_sequence_idx bigint
) WITH bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE uhura.job_task_hierarchy (
    appname text,
    jobid uuid,
    parenttaskname text,
    childtaskname text,
    PRIMARY KEY ((appname, jobid), parenttaskname, childtaskname)
) WITH CLUSTERING ORDER BY (parenttaskname ASC, childtaskname ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE uhura.notifications_consumer_read_status (
    datasource text,
    event_date timestamp,
    consumer_name text,
    consumer_session_id uuid,
    thread_id int,
    event_ids set<uuid>,
    PRIMARY KEY ((datasource, event_date), consumer_name, consumer_session_id, thread_id)
) WITH CLUSTERING ORDER BY (consumer_name ASC, consumer_session_id ASC, thread_id ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE KEYSPACE glb_partner_api_inventory_stg0 WITH replication = {'class': 'SimpleStrategy', 'replication_factor': '1'}  AND durable_writes = true;

CREATE TABLE glb_partner_api_inventory_stg0.item_inventory_status (
    primary_key text PRIMARY KEY,
    created_dtm timestamp,
    error text,
    ims_update_inventory_request text,
    ims_update_inventory_response text,
    ims_update_ship_node_defn_request text,
    ims_update_ship_node_defn_response text,
    partner_id text,
    request text,
    response text,
    sku text,
    solr_query text,
    status text
) WITH bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.LeveledCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.0
    AND default_time_to_live = 60
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.1
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE glb_partner_api_inventory_stg0.inventory_item_status (
    primary_key text PRIMARY KEY,
    batch_id text,
    created_dtm timestamp,
    error list<text>,
    feed_id text,
    ims_update_inventory_request text,
    ims_update_inventory_response text,
    ims_update_ship_node_defn_request text,
    ims_update_ship_node_defn_response text,
    iqs_query_offer_request text,
    iqs_query_offer_response text,
    item_index text,
    item_payload text,
    item_state text,
    item_status text,
    modified_dtm timestamp,
    partner_id text,
    request text,
    response text,
    sku text,
    solr_query text
) WITH bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.LeveledCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.0
    AND default_time_to_live = 2592000
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.1
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE glb_partner_api_inventory_stg0.feedstatus (
    feed_id text PRIMARY KEY,
    app_ map<text, text>,
    batch_id text,
    correlation_id text,
    created_by text,
    created_dtm timestamp,
    data_error_count int,
    entity_count text,
    entity_count_processed int,
    error list<text>,
    error_code text,
    error_message text,
    feed_source text,
    feed_status text,
    feed_submitted_dtm timestamp,
    feed_type text,
    file_name text,
    is_gmp_partner boolean,
    istr_ map<text, text>,
    locale text,
    mart_id text,
    modified_by text,
    modified_dtm timestamp,
    org_id text,
    partner_id text,
    seller_id text,
    solr_query text,
    success_count int,
    system_error_count int,
    tenant_id text,
    timeout_error_count int,
    transaction_id text
) WITH bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE glb_partner_api_inventory_stg0.feed_item_status_index (
    feed_id text,
    shard int,
    sku text,
    sku_index int,
    batch_id text,
    correlation_id text,
    created_dtm timestamp,
    crossref_item_id text,
    error list<text>,
    feed_submitted_dtm timestamp,
    iso_job_id text,
    istr_ map<text, text>,
    item_index text,
    item_processing_route text,
    item_processing_state text,
    item_processing_status text,
    item_processing_type text,
    mart_id text,
    modified_dtm timestamp,
    offer_id text,
    orgid text,
    rca_requested_dtm timestamp,
    seller_id text,
    solr_query text,
    version text,
    wpid text,
    wpid_requested_dtm timestamp,
    PRIMARY KEY ((feed_id, shard, sku, sku_index))
) WITH bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.0
    AND default_time_to_live = 2592000
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.1
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE glb_partner_api_inventory_stg0.users_sasi (
    userid text PRIMARY KEY,
    first_name text,
    last_name text
) WITH bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 300
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE glb_partner_api_inventory_stg0.inventory_feeditem_status (
    feed_id text,
    sku text,
    item_index text,
    batch_id text,
    created_dtm timestamp,
    error list<text>,
    ims_update_inventory_request text,
    ims_update_inventory_response text,
    ims_update_ship_node_defn_request text,
    ims_update_ship_node_defn_response text,
    iqs_query_offer_request text,
    iqs_query_offer_response text,
    item_payload text,
    item_state text,
    item_status text,
    modified_dtm timestamp,
    partner_id text,
    request text,
    response text,
    solr_query text,
    PRIMARY KEY (feed_id, sku, item_index)
) WITH CLUSTERING ORDER BY (sku ASC, item_index ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.LeveledCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.0
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.1
    AND speculative_retry = '99.0PERCENTILE';

CREATE KEYSPACE iso_txn_stg0 WITH replication = {'class': 'SimpleStrategy', 'replication_factor': '1'}  AND durable_writes = true;

CREATE TABLE iso_txn_stg0.iso_txn (
    key text PRIMARY KEY,
    iso_response text
) WITH bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'max_threshold': '32', 'min_threshold': '4', 'cold_reads_to_omit': '0.05', 'enabled': 'true', 'unchecked_tombstone_compaction': 'false', 'tombstone_compaction_interval': '86400', 'min_sstable_size': '50', 'tombstone_threshold': '0.2', 'bucket_low': '0.5', 'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy', 'bucket_high': '1.5'}
    AND compression = {'chunk_length_kb': '64', 'crc_check_chance': '1.0', 'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 432000
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE KEYSPACE gmp_payment_platform_dev WITH replication = {'class': 'SimpleStrategy', 'replication_factor': '1'}  AND durable_writes = true;

CREATE TABLE gmp_payment_platform_dev.partner_txn (
    tenant_id text,
    source text,
    partner_id text,
    shard text,
    invoice_id text,
    additional_info text,
    created_dtm timestamp,
    invoice_date timestamp,
    invoice_memo text,
    line_num int,
    modified_dtm timestamp,
    net_payable decimal,
    status text,
    PRIMARY KEY ((tenant_id, source, partner_id, shard), invoice_id)
) WITH CLUSTERING ORDER BY (invoice_id ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE gmp_payment_platform_dev.payments_checkpoint (
    checkpoint_key text PRIMARY KEY,
    checkpoint_value text
) WITH bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE gmp_payment_platform_dev.partner_status_audit (
    partner_id text,
    created_dtm timestamp,
    deactivation_reason text,
    hold_period int,
    is_active boolean,
    last_settled text,
    settle_cycle text,
    settle_until text,
    user_id text,
    PRIMARY KEY (partner_id, created_dtm)
) WITH CLUSTERING ORDER BY (created_dtm ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE gmp_payment_platform_dev.gmp_order_commission (
    sales_order_no text,
    sales_order_line_no int,
    event_name text,
    add_ref text,
    comm_source text,
    commission_perc decimal,
    commission_proc_state text,
    commission_status text,
    contract_category text,
    created_dtm timestamp,
    error_add_info text,
    error_code text,
    error_desc text,
    error_source text,
    event_id text,
    ib_category text,
    item_charge decimal,
    item_charge_commission_amt decimal,
    item_charge_tax_amt decimal,
    item_id text,
    modified_by text,
    modified_dtm timestamp,
    offer_id text,
    order_created_dtm timestamp,
    ordered_qty int,
    orig_seller_charge decimal,
    partner_id text,
    po_line_no text,
    po_no text,
    product_type text,
    reason_code text,
    retry_count int,
    ship_charge decimal,
    ship_charge_commission_amt decimal,
    ship_charge_tax_amt decimal,
    tenant_id text,
    unit_seller_price decimal,
    unit_subsidized_price decimal,
    user_id text,
    vertical_id text,
    PRIMARY KEY (sales_order_no, sales_order_line_no, event_name)
) WITH CLUSTERING ORDER BY (sales_order_line_no ASC, event_name ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE gmp_payment_platform_dev.partner_ledger (
    partner_id text,
    epoch_day int,
    closing_balance decimal,
    gmv decimal,
    gmv_date text,
    opening_balance decimal,
    owed_until_now decimal,
    ptnr_txn_detail text,
    ptnr_txn_net_payable decimal,
    settled_until_date text,
    settled_until_now decimal,
    wired decimal,
    wired_until_now decimal,
    PRIMARY KEY (partner_id, epoch_day)
) WITH CLUSTERING ORDER BY (epoch_day DESC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'max_threshold': '32', 'min_threshold': '4', 'cold_reads_to_omit': '0.05', 'enabled': 'true', 'unchecked_tombstone_compaction': 'false', 'tombstone_compaction_interval': '86400', 'min_sstable_size': '50', 'tombstone_threshold': '0.2', 'bucket_low': '0.5', 'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy', 'bucket_high': '1.5'}
    AND compression = {'chunk_length_kb': '64', 'crc_check_chance': '1.0', 'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE gmp_payment_platform_dev.mt_payout_audit (
    tenant_id text,
    payee_id text,
    shard text,
    created_dtm timestamp,
    audit_id text,
    client_reference_id text,
    currency text,
    pay_amt decimal,
    payout_id text,
    payout_provider_status text,
    resp_code int,
    resp_description text,
    resp_payload text,
    settl_date text,
    status text,
    txn_type text,
    user_id text,
    PRIMARY KEY ((tenant_id, payee_id, shard), created_dtm)
) WITH CLUSTERING ORDER BY (created_dtm DESC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE gmp_payment_platform_dev.gmp_order_by_partner (
    partner_id text,
    event_day text,
    event_name text,
    trans_dtm timestamp,
    sales_order_no text,
    sales_order_line_no int,
    event_id text,
    sub_line_id text,
    add_ref text,
    commission_perc decimal,
    commission_proc_state text,
    commission_status text,
    contract_category text,
    created_dtm timestamp,
    ib_category text,
    item_charge decimal,
    item_charge_commission_amt decimal,
    item_charge_tax_amt decimal,
    modified_by text,
    modified_dtm timestamp,
    offer_id text,
    order_created_dtm timestamp,
    ordered_qty int,
    orig_seller_charge decimal,
    po_line_no text,
    po_no text,
    reason_code text,
    ship_charge decimal,
    ship_charge_commission_amt decimal,
    ship_charge_tax_amt decimal,
    tenant_id text,
    user_id text,
    vertical_id text,
    PRIMARY KEY ((partner_id, event_day, event_name), trans_dtm, sales_order_no, sales_order_line_no, event_id, sub_line_id)
) WITH CLUSTERING ORDER BY (trans_dtm ASC, sales_order_no ASC, sales_order_line_no ASC, event_id ASC, sub_line_id ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE gmp_payment_platform_dev.partner_status (
    partner_id text PRIMARY KEY,
    deactivation_reason text,
    hold_period int,
    is_active boolean,
    last_settled text,
    last_wired text,
    settle_cycle text,
    settle_until text
) WITH bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE gmp_payment_platform_dev.mt_gmv_daily (
    tenant_id text,
    txn_id text,
    adj_code text,
    adj_desc text,
    commission_rate decimal,
    created_dtm timestamp,
    currency text,
    customer_first_name text,
    customer_last_name text,
    customer_tender decimal,
    error text,
    gis_status text,
    item_charge_taxes decimal,
    item_id text,
    item_title text,
    item_upc text,
    modified_dtm timestamp,
    net_commission decimal,
    order_created_dtm text,
    order_line_no text,
    order_no text,
    partner_id text,
    partner_item_id text,
    partner_payable decimal,
    shipped_qty text,
    shipping_charge_taxes decimal,
    status text,
    txn_dtm text,
    txn_type text,
    PRIMARY KEY ((tenant_id, txn_id))
) WITH bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE gmp_payment_platform_dev.mt_partner_status (
    tenant_id text,
    partner_id text,
    deactivation_reason text,
    is_active boolean,
    last_settled text,
    last_wired text,
    settle_cycle text,
    PRIMARY KEY ((tenant_id, partner_id))
) WITH bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE gmp_payment_platform_dev.mt_partner_status_audit (
    tenant_id text,
    partner_id text,
    created_dtm timestamp,
    deactivation_reason text,
    is_active boolean,
    last_settled text,
    settle_cycle text,
    user_id text,
    PRIMARY KEY ((tenant_id, partner_id), created_dtm)
) WITH CLUSTERING ORDER BY (created_dtm DESC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE gmp_payment_platform_dev.table2 (
    prim int PRIMARY KEY,
    name text
) WITH bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE gmp_payment_platform_dev.gmv_daily (
    txn_id text PRIMARY KEY,
    created_dtm timestamp,
    customer_billing_state text,
    customer_first_name text,
    customer_last_name text,
    error text,
    gis_status text,
    item_id text,
    item_title text,
    modified_dtm timestamp,
    order_created_dtm text,
    order_line_no text,
    order_no text,
    partner_id text,
    partner_item_id text,
    partner_payable decimal,
    status text,
    txn_dtm text,
    txn_type text
) WITH bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE gmp_payment_platform_dev.gmp_mt_order_commission (
    tenant_id text,
    sales_order_no text,
    sales_order_line_no int,
    event_name text,
    event_id text,
    add_ref text,
    comm_source text,
    commission_perc decimal,
    commission_proc_state text,
    commission_status text,
    contract_category text,
    created_dtm timestamp,
    error_add_info text,
    error_code text,
    error_desc text,
    error_source text,
    ib_category text,
    is_default boolean,
    item_charge decimal,
    item_charge_commission decimal,
    item_charge_commission_curr text,
    item_charge_curr text,
    item_charge_qty int,
    item_charge_tax decimal,
    item_charge_tax_curr text,
    item_id text,
    modified_by text,
    modified_dtm timestamp,
    offer_id text,
    order_created_dtm timestamp,
    partner_id text,
    po_line_no text,
    po_no text,
    product_type text,
    reason_code text,
    retry_count int,
    ship_charge decimal,
    ship_charge_commission decimal,
    ship_charge_commission_curr text,
    ship_charge_curr text,
    ship_charge_qty int,
    ship_charge_tax decimal,
    ship_charge_tax_curr text,
    user_id text,
    vertical_id text,
    PRIMARY KEY ((tenant_id, sales_order_no), sales_order_line_no, event_name, event_id)
) WITH CLUSTERING ORDER BY (sales_order_line_no ASC, event_name ASC, event_id ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE gmp_payment_platform_dev.mt_partner_ledger (
    tenant_id text,
    partner_id text,
    epoch_day int,
    closing_balance decimal,
    gmv decimal,
    gmv_date text,
    opening_balance decimal,
    owed_until_now decimal,
    ptnr_txn_detail text,
    ptnr_txn_net_payable decimal,
    settled_until_now decimal,
    wired decimal,
    wired_until_now decimal,
    PRIMARY KEY ((tenant_id, partner_id), epoch_day)
) WITH CLUSTERING ORDER BY (epoch_day DESC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'max_threshold': '32', 'min_threshold': '4', 'cold_reads_to_omit': '0.05', 'enabled': 'true', 'unchecked_tombstone_compaction': 'false', 'tombstone_compaction_interval': '86400', 'min_sstable_size': '50', 'tombstone_threshold': '0.2', 'bucket_low': '0.5', 'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy', 'bucket_high': '1.5'}
    AND compression = {'chunk_length_kb': '64', 'crc_check_chance': '1.0', 'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE gmp_payment_platform_dev.partner_payout_audit (
    partner_id text,
    created_dtm timestamp,
    audit_id text,
    client_reference_id text,
    currency text,
    pay_amt decimal,
    payout_id text,
    resp_code int,
    resp_description text,
    resp_payload text,
    settl_date text,
    status text,
    txn_type text,
    user_id text,
    PRIMARY KEY (partner_id, created_dtm)
) WITH CLUSTERING ORDER BY (created_dtm ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE gmp_payment_platform_dev.mpress_ret (
    sales_order_no text,
    sales_order_line_no int,
    event_name text,
    pkg_tracking_no text,
    add_ref text,
    adj_charge decimal,
    adj_proc_state text,
    adj_status text,
    bpm_res_details text,
    created_dtm timestamp,
    error_add_info text,
    error_code text,
    error_desc text,
    error_source text,
    event_id text,
    modified_by text,
    modified_dtm timestamp,
    partner_id text,
    pkg_weight_in_lb decimal,
    retry_count int,
    return_order_no text,
    returned_qty int,
    PRIMARY KEY (sales_order_no, sales_order_line_no, event_name, pkg_tracking_no)
) WITH CLUSTERING ORDER BY (sales_order_line_no ASC, event_name ASC, pkg_tracking_no ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE gmp_payment_platform_dev.gmp_order_checkout (
    sales_order_no text,
    offer_id text,
    created_dtm timestamp,
    currency text,
    unit_orig_seller_price decimal,
    PRIMARY KEY (sales_order_no, offer_id)
) WITH CLUSTERING ORDER BY (offer_id ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE gmp_payment_platform_dev.object_store (
    object_key text PRIMARY KEY,
    object_value blob
) WITH bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'tombstone_threshold': '0.1', 'tombstone_compaction_interval': '0', 'unchecked_tombstone_compaction': 'false', 'class': 'org.apache.cassandra.db.compaction.LeveledCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.0
    AND default_time_to_live = 2592000
    AND gc_grace_seconds = 100
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.1
    AND speculative_retry = '99.0PERCENTILE';

CREATE KEYSPACE dbaasuser WITH replication = {'class': 'SimpleStrategy', 'replication_factor': '1'}  AND durable_writes = true;

CREATE KEYSPACE gmp_payment_platform WITH replication = {'class': 'SimpleStrategy', 'replication_factor': '1'}  AND durable_writes = true;

CREATE TABLE gmp_payment_platform.payments_checkpoint (
    checkpoint_key text PRIMARY KEY,
    checkpoint_value text
) WITH bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE gmp_payment_platform.gmp_order_commission (
    sales_order_no text,
    sales_order_line_no int,
    event_name text,
    add_ref text,
    comm_source text,
    commission_perc decimal,
    commission_proc_state text,
    commission_status text,
    contract_category text,
    created_dtm timestamp,
    error_add_info text,
    error_code text,
    error_desc text,
    error_source text,
    event_id text,
    ib_category text,
    item_charge decimal,
    item_charge_commission_amt decimal,
    item_charge_tax_amt decimal,
    item_id text,
    modified_by text,
    modified_dtm timestamp,
    offer_id text,
    order_created_dtm timestamp,
    ordered_qty int,
    orig_seller_charge decimal,
    partner_id text,
    po_line_no text,
    po_no text,
    product_type text,
    reason_code text,
    retry_count int,
    ship_charge decimal,
    ship_charge_commission_amt decimal,
    ship_charge_tax_amt decimal,
    tenant_id text,
    unit_seller_price decimal,
    unit_subsidized_price decimal,
    user_id text,
    vertical_id text,
    PRIMARY KEY (sales_order_no, sales_order_line_no, event_name)
) WITH CLUSTERING ORDER BY (sales_order_line_no ASC, event_name ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE gmp_payment_platform.partner_ledger (
    partner_id text,
    epoch_day int,
    closing_balance decimal,
    gmv decimal,
    gmv_date text,
    opening_balance decimal,
    owed_until_now decimal,
    settled_until_now decimal,
    wired decimal,
    wired_until_now decimal,
    PRIMARY KEY (partner_id, epoch_day)
) WITH CLUSTERING ORDER BY (epoch_day DESC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'max_threshold': '32', 'min_threshold': '4', 'cold_reads_to_omit': '0.05', 'enabled': 'true', 'unchecked_tombstone_compaction': 'false', 'tombstone_compaction_interval': '86400', 'min_sstable_size': '50', 'tombstone_threshold': '0.2', 'bucket_low': '0.5', 'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy', 'bucket_high': '1.5'}
    AND compression = {'chunk_length_kb': '64', 'crc_check_chance': '1.0', 'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE gmp_payment_platform.partner_status_audit (
    partner_id text,
    created_dtm timestamp,
    deactivation_reason text,
    is_active boolean,
    last_settled text,
    settle_cycle text,
    user_id text,
    PRIMARY KEY (partner_id, created_dtm)
) WITH CLUSTERING ORDER BY (created_dtm ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE gmp_payment_platform.gmp_order_by_partner (
    partner_id text,
    event_day text,
    event_name text,
    trans_dtm timestamp,
    sales_order_no text,
    sales_order_line_no int,
    event_id text,
    sub_line_id text,
    add_ref text,
    commission_perc decimal,
    commission_proc_state text,
    commission_status text,
    contract_category text,
    created_dtm timestamp,
    ib_category text,
    item_charge decimal,
    item_charge_commission_amt decimal,
    item_charge_tax_amt decimal,
    modified_by text,
    modified_dtm timestamp,
    offer_id text,
    order_created_dtm timestamp,
    ordered_qty int,
    orig_seller_charge decimal,
    po_line_no text,
    po_no text,
    reason_code text,
    ship_charge decimal,
    ship_charge_commission_amt decimal,
    ship_charge_tax_amt decimal,
    tenant_id text,
    user_id text,
    vertical_id text,
    PRIMARY KEY ((partner_id, event_day, event_name), trans_dtm, sales_order_no, sales_order_line_no, event_id, sub_line_id)
) WITH CLUSTERING ORDER BY (trans_dtm ASC, sales_order_no ASC, sales_order_line_no ASC, event_id ASC, sub_line_id ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE gmp_payment_platform.partner_status (
    partner_id text PRIMARY KEY,
    deactivation_reason text,
    is_active boolean,
    last_settled text,
    last_wired text,
    settle_cycle text
) WITH bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE gmp_payment_platform.item (
    vendor_id text,
    product_id text,
    product_id_type text,
    mart_id int,
    category text,
    created_by text,
    created_dtm timestamp,
    current_state text,
    end_state text,
    end_state_dtm timestamp,
    feed_id text,
    modified_dtm timestamp,
    offer_id text,
    product_name text,
    short_description text,
    si_number text,
    sku text,
    spec_version text,
    subcategory text,
    updated_by text,
    wpid text,
    PRIMARY KEY ((vendor_id, product_id), product_id_type, mart_id)
) WITH CLUSTERING ORDER BY (product_id_type ASC, mart_id ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'max_threshold': '32', 'min_threshold': '4', 'cold_reads_to_omit': '0.05', 'enabled': 'true', 'unchecked_tombstone_compaction': 'false', 'tombstone_compaction_interval': '86400', 'min_sstable_size': '50', 'tombstone_threshold': '0.2', 'bucket_low': '0.5', 'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy', 'bucket_high': '1.5'}
    AND compression = {'chunk_length_kb': '64', 'crc_check_chance': '1.0', 'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.0
    AND default_time_to_live = 2592000
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.1
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE gmp_payment_platform.gmv_daily (
    txn_id text PRIMARY KEY,
    created_dtm timestamp,
    customer_billing_state text,
    customer_first_name text,
    customer_last_name text,
    error text,
    gis_status text,
    item_id text,
    item_title text,
    modified_dtm timestamp,
    order_created_dtm text,
    order_line_no text,
    order_no text,
    partner_id text,
    partner_item_id text,
    partner_payable decimal,
    status text,
    txn_dtm text,
    txn_type text
) WITH bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE gmp_payment_platform.partner_payout_audit (
    partner_id text,
    created_dtm timestamp,
    audit_id text,
    client_reference_id text,
    currency text,
    pay_amt decimal,
    payout_id text,
    resp_code int,
    resp_description text,
    resp_payload text,
    settl_date text,
    status text,
    txn_type text,
    user_id text,
    PRIMARY KEY (partner_id, created_dtm)
) WITH CLUSTERING ORDER BY (created_dtm ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE gmp_payment_platform.mpress_ret (
    sales_order_no text,
    sales_order_line_no int,
    event_name text,
    pkg_tracking_no text,
    add_ref text,
    adj_charge decimal,
    adj_proc_state text,
    adj_status text,
    bpm_res_details text,
    created_dtm timestamp,
    error_add_info text,
    error_code text,
    error_desc text,
    error_source text,
    event_id text,
    modified_by text,
    modified_dtm timestamp,
    partner_id text,
    pkg_weight_in_lb decimal,
    retry_count int,
    return_order_no text,
    returned_qty int,
    PRIMARY KEY (sales_order_no, sales_order_line_no, event_name, pkg_tracking_no)
) WITH CLUSTERING ORDER BY (sales_order_line_no ASC, event_name ASC, pkg_tracking_no ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE gmp_payment_platform.gmp_order_checkout (
    sales_order_no text,
    offer_id text,
    created_dtm timestamp,
    currency text,
    unit_orig_seller_price decimal,
    PRIMARY KEY (sales_order_no, offer_id)
) WITH CLUSTERING ORDER BY (offer_id ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE gmp_payment_platform.object_store (
    object_key text PRIMARY KEY,
    object_value blob
) WITH bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'tombstone_threshold': '0.1', 'tombstone_compaction_interval': '0', 'unchecked_tombstone_compaction': 'false', 'class': 'org.apache.cassandra.db.compaction.LeveledCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.0
    AND default_time_to_live = 2592000
    AND gc_grace_seconds = 100
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.1
    AND speculative_retry = '99.0PERCENTILE';
