#!/bin/bash
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Hadoop environment variables from Hadoop configuration files

# core-site.xml
export CORE_SITE_XML_fs_default_name="hdfs://namenode"
export CORE_SITE_XML_fs_defaultFS="hdfs://namenode"

# hdfs-site.xml
export HDFS_SITE_XML_dfs_namenode_rpc_address="namenode:8020"
export HDFS_SITE_XML_dfs_replication="1"
export HDFS_SITE_XML_dfs_client_use_datanode_hostname="true"
export HDFS_SITE_XML_dfs_datanode_use_datanode_hostname="true"

# mapred-site.xml
export MAPRED_SITE_XML_mapreduce_framework_name="yarn"
export MAPRED_SITE_XML_yarn_app_mapreduce_am_env="HADOOP_MAPRED_HOME=$HADOOP_HOME"
export MAPRED_SITE_XML_mapreduce_map_env="HADOOP_MAPRED_HOME=$HADOOP_HOME"
export MAPRED_SITE_XML_mapreduce_reduce_env="HADOOP_MAPRED_HOME=$HADOOP_HOME"

# yarn-site.xml
export YARN_SITE_XML_yarn_resourcemanager_hostname="resourcemanager"
export YARN_SITE_XML_yarn_nodemanager_pmem_check_enabled="false"
export YARN_SITE_XML_yarn_nodemanager_delete_debug_delay_sec="600"
export YARN_SITE_XML_yarn_nodemanager_vmem_check_enabled="false"
export YARN_SITE_XML_yarn_nodemanager_aux_services="mapreduce_shuffle"

# capacity-scheduler.xml
export CAPACITY_SCHEDULER_XML_yarn_scheduler_capacity_maximum_applications="10000"
export CAPACITY_SCHEDULER_XML_yarn_scheduler_capacity_maximum_am_resource_percent="0.1"
export CAPACITY_SCHEDULER_XML_yarn_scheduler_capacity_resource_calculator="org.apache.hadoop.yarn.util.resource.DefaultResourceCalculator"
export CAPACITY_SCHEDULER_XML_yarn_scheduler_capacity_root_queues="default"
export CAPACITY_SCHEDULER_XML_yarn_scheduler_capacity_root_default_capacity="100"
export CAPACITY_SCHEDULER_XML_yarn_scheduler_capacity_root_default_user_limit_factor="1"
export CAPACITY_SCHEDULER_XML_yarn_scheduler_capacity_root_default_maximum_capacity="100"
export CAPACITY_SCHEDULER_XML_yarn_scheduler_capacity_root_default_state="RUNNING"
export CAPACITY_SCHEDULER_XML_yarn_scheduler_capacity_root_default_acl_submit_applications="*"
export CAPACITY_SCHEDULER_XML_yarn_scheduler_capacity_root_default_acl_administer_queue="*"
export CAPACITY_SCHEDULER_XML_yarn_scheduler_capacity_node_locality_delay="40"
export CAPACITY_SCHEDULER_XML_yarn_scheduler_capacity_queue_mappings=""
export CAPACITY_SCHEDULER_XML_yarn_scheduler_capacity_queue_mappings_override_enable="false"