-- CreateTable
CREATE TABLE `account_approval_steps` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `step_number` INTEGER NOT NULL,
    `role` VARCHAR(255) NOT NULL,
    `group_id` INTEGER NOT NULL,
    `created_at` DATETIME(6) NOT NULL,
    `updated_at` DATETIME(6) NOT NULL,

    INDEX `index_account_approval_steps_on_group_id`(`group_id`),
    UNIQUE INDEX `index_account_approval_steps_role_group`(`step_number`, `role`, `group_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `account_approvals` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `account_id` INTEGER NOT NULL,
    `approver_id` INTEGER NULL,
    `previous_id` BIGINT NULL,
    `role` VARCHAR(255) NULL,
    `status_id` INTEGER NULL,
    `finished_at` DATETIME(0) NULL,
    `note` TEXT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `index_account_approvals_on_account_id`(`account_id`),
    INDEX `index_account_approvals_on_approver_id`(`approver_id`),
    INDEX `index_account_approvals_on_previous_id`(`previous_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `account_flow_joint_applicants` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `advisor_create_new_account_flow_id` INTEGER NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `account_goals` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `weight` FLOAT NULL,
    `account_id` INTEGER NOT NULL,
    `goal_id` INTEGER NOT NULL,
    `model_portfolio_id` INTEGER NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `index_account_goals_on_account_id`(`account_id`),
    INDEX `index_account_goals_on_goal_id`(`goal_id`),
    INDEX `index_account_goals_on_model_portfolio_id`(`model_portfolio_id`),
    UNIQUE INDEX `index_account_goals_on_account_id_and_goal_id`(`account_id`, `goal_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `account_lifecycles_read_models` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `account_id` INTEGER NULL,
    `client_name` VARCHAR(255) NULL,
    `account_number` VARCHAR(255) NULL,
    `status_id` INTEGER NULL,
    `type_id` INTEGER NULL,
    `started_at` DATETIME(0) NULL,
    `completed_at` DATETIME(0) NULL,
    `opened_at` DATETIME(0) NULL,
    `funded_at` DATETIME(0) NULL,
    `funded1000_at` DATETIME(0) NULL,
    `balance` DECIMAL(17, 2) NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `index_account_lifecycles_read_models_on_account_id`(`account_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `account_number_assignments` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `account_id` INTEGER NOT NULL,
    `custodian_id` INTEGER NOT NULL,
    `effective_date` DATE NULL,
    `account_number` VARCHAR(255) NOT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `index_account_number_assignments_on_account_id`(`account_id`),
    INDEX `index_account_number_assignments_on_custodian_id`(`custodian_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `account_portfolio_histories` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `account_id` INTEGER NOT NULL,
    `risk_level` INTEGER NOT NULL,
    `portfolio_option_id` INTEGER NOT NULL,
    `created_at` DATETIME(6) NOT NULL,
    `updated_at` DATETIME(6) NOT NULL,

    INDEX `fk_rails_71ce12fec7`(`account_id`),
    INDEX `index_account_portfolio_histories_on_portfolio_option_id`(`portfolio_option_id`),
    INDEX `index_account_portfolio_histories_on_risk_level`(`risk_level`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `account_read_models` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `account_id` INTEGER NULL,
    `user_id` INTEGER NULL,
    `started_at` DATETIME(0) NULL,
    `email` VARCHAR(255) NULL,
    `client_name` VARCHAR(255) NULL,
    `account_number` VARCHAR(255) NULL,
    `status_id` INTEGER NULL,
    `type_id` INTEGER NULL,
    `responsible` BOOLEAN NULL,
    `application_completed` BOOLEAN NULL,
    `balance` DECIMAL(17, 2) NULL,
    `timeframe` INTEGER NULL,
    `risk_level` INTEGER NULL,
    `max_drift` DECIMAL(5, 2) NULL,
    `has_promotions` BOOLEAN NULL,
    `client_stat_terms` VARCHAR(255) NULL,
    `rejection_reason` TEXT NULL,
    `last_kyc` DATETIME(0) NULL,
    `can_delete` BOOLEAN NULL,
    `search_terms` VARCHAR(255) NULL,
    `primary_advisor_name` VARCHAR(255) NULL,
    `skip_rebalancing` BOOLEAN NOT NULL DEFAULT false,
    `balance_30_days_ago` DECIMAL(17, 2) NULL,
    `primary_advisor_user_id` INTEGER NULL,
    `custodian_id` INTEGER NULL,
    `portfolio_option_id` INTEGER NULL,

    INDEX `account_read_models_account_number`(`account_number`),
    INDEX `account_read_models_fulltext_index`(`search_terms`),
    INDEX `index_account_read_models_on_account_id`(`account_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `account_transfer_securities` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `account_transfer_id` INTEGER NULL,
    `description` VARCHAR(255) NULL,
    `quantity` DECIMAL(17, 4) NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `index_account_transfer_securities_on_account_transfer_id`(`account_transfer_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `account_transfers` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `external_account_number` VARCHAR(255) NULL,
    `institution_name` VARCHAR(255) NULL,
    `account_id` INTEGER NULL,
    `dsc_id` INTEGER NULL,
    `in_kind` BOOLEAN NULL,
    `partial_transfer` BOOLEAN NULL,
    `status_id` INTEGER NULL,
    `cancelled_at` DATETIME(0) NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,
    `marked_sent_at` DATETIME(0) NULL,
    `created_by_id` INTEGER NOT NULL,
    `amount` DECIMAL(9, 0) NULL,
    `advisor_create_new_transfer_flow_id` BIGINT NULL,

    INDEX `fk_rails_1880f5b55c`(`account_id`),
    INDEX `index_account_transfers_on_advisor_create_new_transfer_flow_id`(`advisor_create_new_transfer_flow_id`),
    INDEX `index_account_transfers_on_created_by_id`(`created_by_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `accounts` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER NOT NULL,
    `beneficiary_id` INTEGER NULL,
    `type_id` INTEGER NULL,
    `number` VARCHAR(255) NULL,
    `cash` DECIMAL(17, 2) NULL,
    `acknowledge_ips` BOOLEAN NULL,
    `acknowledge_fs` BOOLEAN NULL,
    `progress` INTEGER NULL,
    `rejection_reason` TEXT NULL,
    `created_at` DATETIME(0) NULL,
    `updated_at` DATETIME(0) NULL,
    `responsible` BOOLEAN NULL,
    `trial_deactivates_at` DATE NULL,
    `trial_expires_at` DATE NULL,
    `trial_status_id` INTEGER NULL,
    `application_completed` BOOLEAN NULL,
    `skip_rebalancing` BOOLEAN NOT NULL DEFAULT false,
    `nickname` VARCHAR(255) NULL,
    `client_name_override` VARCHAR(255) NULL,
    `approved_at` DATETIME(0) NULL,
    `closed_at` DATETIME(0) NULL,
    `group_savings_plan_id` INTEGER NULL,
    `custodian_id` INTEGER NOT NULL DEFAULT 1,
    `spousal_joint_account` BOOLEAN NULL,
    `bank_account_id` INTEGER NULL,
    `advisor_create_new_account_flow_id` INTEGER NULL,
    `jurisdiction_id` INTEGER NULL,
    `portfolio_option_id` INTEGER NULL,
    `external_client_id` VARCHAR(255) NULL,
    `ni54_disclosure_option_id` INTEGER NULL,
    `ni54_receive_materials_option_id` INTEGER NULL,
    `ni54_electronic_delivery_option_id` INTEGER NULL DEFAULT 0,
    `return_objective_id` INTEGER NULL,
    `trustee` VARCHAR(255) NULL,

    UNIQUE INDEX `index_accounts_on_number`(`number`),
    INDEX `index_accounts_on_advisor_create_new_account_flow_id`(`advisor_create_new_account_flow_id`),
    INDEX `index_accounts_on_bank_account_id`(`bank_account_id`),
    INDEX `index_accounts_on_beneficiary_id`(`beneficiary_id`),
    INDEX `index_accounts_on_custodian_id`(`custodian_id`),
    INDEX `index_accounts_on_group_savings_plan_id`(`group_savings_plan_id`),
    INDEX `index_accounts_on_user_id`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `activities` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `type_id` INTEGER NULL,
    `date` DATE NULL,
    `description` VARCHAR(255) NULL,
    `account_id` INTEGER NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,
    `user_id` INTEGER NULL,
    `notes` TEXT NULL,
    `external_transaction_id` VARCHAR(255) NULL,
    `notification_status_id` INTEGER NOT NULL DEFAULT 0,
    `transaction_code` VARCHAR(255) NULL,
    `amount` DECIMAL(17, 4) NULL,

    INDEX `index_activities_on_account_id`(`account_id`),
    INDEX `index_activities_on_user_id`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `addresses` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `country` VARCHAR(255) NULL,
    `locality` VARCHAR(255) NULL,
    `region` VARCHAR(255) NULL,
    `postal_code` VARCHAR(255) NULL,
    `unit` VARCHAR(255) NULL,
    `street_address` VARCHAR(255) NULL,
    `street_number` VARCHAR(255) NULL,
    `street_name` VARCHAR(255) NULL,
    `type_id` INTEGER NULL,
    `same_as_id` INTEGER NULL,
    `contact_id` INTEGER NULL,
    `contact_type` VARCHAR(255) NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,
    `street_type` VARCHAR(255) NULL,
    `street_direction_id` INTEGER NULL,
    `unit_type` VARCHAR(255) NULL,

    INDEX `index_addresses_on_contact_type_and_contact_id`(`contact_type`, `contact_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `advisor_assignments` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `client_advisor_assignment_id` INTEGER NOT NULL,
    `advisor_id` INTEGER NOT NULL,
    `primary` BOOLEAN NULL,
    `fee_share` DECIMAL(5, 2) NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,
    `rep_code_id` BIGINT NULL,
    `registered_in_province` BOOLEAN NULL,
    `shared_office_entities` VARCHAR(255) NULL,

    INDEX `fk_rails_5bfacf7c7a`(`advisor_id`),
    INDEX `index_advisor_assignments_on_client_advisor_assignment_id`(`client_advisor_assignment_id`),
    INDEX `index_advisor_assignments_on_rep_code_id`(`rep_code_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `advisor_beneficiary_forms` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `personal_relation_id` INTEGER NOT NULL,
    `advisor_create_new_account_flow_id` INTEGER NOT NULL,
    `legal_guardian_id` INTEGER NULL,
    `legal_guardian_other` BOOLEAN NOT NULL DEFAULT false,
    `primary_caregiver_id` INTEGER NULL,
    `primary_caregiver_other` BOOLEAN NOT NULL DEFAULT false,
    `type` VARCHAR(255) NOT NULL,
    `percent` DECIMAL(5, 2) NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `fk_rails_224a0d6b63`(`primary_caregiver_id`),
    INDEX `fk_rails_9d9f1d9946`(`legal_guardian_id`),
    INDEX `index_advisor_beneficiary_forms_on_account_flow_id`(`advisor_create_new_account_flow_id`),
    INDEX `index_advisor_beneficiary_forms_on_personal_relation_id`(`personal_relation_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `advisor_create_new_account_flows` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `goal_type` VARCHAR(255) NULL,
    `initial` DECIMAL(17, 2) NULL,
    `ongoing` DECIMAL(17, 2) NULL,
    `target_amount` DECIMAL(16, 2) NULL,
    `notimeframe` BOOLEAN NULL,
    `timeframe` FLOAT NULL,
    `account_type_id` INTEGER NULL,
    `client_id` INTEGER NOT NULL,
    `advisor_id` INTEGER NOT NULL,
    `created_at` DATETIME(0) NULL,
    `updated_at` DATETIME(0) NULL,
    `password` VARCHAR(255) NULL,
    `status` VARCHAR(255) NOT NULL DEFAULT 'pending',
    `responsible` BOOLEAN NOT NULL DEFAULT false,
    `advisor_create_new_client_flow_id` INTEGER NULL,
    `jurisdiction_id` INTEGER NULL,
    `portfolio_option_id` INTEGER NULL,
    `account_nickname` VARCHAR(255) NULL,

    INDEX `fk_rails_1278c27d8a`(`advisor_id`),
    INDEX `fk_rails_dffd8d060d`(`client_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `advisor_create_new_client_flows` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `client_id` INTEGER NOT NULL,
    `advisor_id` INTEGER NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `status` VARCHAR(255) NULL,
    `password` VARCHAR(255) NULL,
    `created_at` DATETIME(0) NULL,
    `updated_at` DATETIME(0) NULL,
    `advisor_referral_code` VARCHAR(255) NULL,
    `consent_at` DATETIME(0) NULL,

    UNIQUE INDEX `index_advisor_create_new_client_flows_on_password`(`password`),
    INDEX `fk_rails_5009430975`(`advisor_id`),
    INDEX `fk_rails_55cae3b731`(`client_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `advisor_create_new_transfer_flows` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `external_account_number` VARCHAR(255) NULL,
    `institution_name` VARCHAR(255) NULL,
    `advisor_create_new_client_flow_id` INTEGER NULL,
    `account_flow_id` INTEGER NULL,
    `dsc_id` INTEGER NULL,
    `in_kind` BOOLEAN NULL,
    `partial_transfer` BOOLEAN NULL,
    `amount` DECIMAL(9, 0) NULL,
    `status` VARCHAR(255) NOT NULL DEFAULT 'pending',
    `expected_amount` DECIMAL(9, 0) NULL,
    `client_id` INTEGER NOT NULL,
    `advisor_id` INTEGER NOT NULL,
    `created_at` DATETIME(6) NOT NULL,
    `updated_at` DATETIME(6) NOT NULL,

    INDEX `fk_rails_45cd0f5de4`(`advisor_create_new_client_flow_id`),
    INDEX `fk_rails_8dbdb47110`(`account_flow_id`),
    INDEX `index_advisor_create_new_transfer_flows_on_advisor_id`(`advisor_id`),
    INDEX `index_advisor_create_new_transfer_flows_on_client_id`(`client_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `advisor_create_new_transfer_instruction_flows` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `type_id` INTEGER NULL,
    `frequency_id` INTEGER NULL,
    `continue_until` DATE NULL,
    `max_occurrence` INTEGER NULL,
    `manual_cancel` BOOLEAN NULL,
    `amount` DECIMAL(17, 2) NULL,
    `transfer_from_type` VARCHAR(255) NOT NULL,
    `transfer_from_id` BIGINT NOT NULL,
    `transfer_to_type` VARCHAR(255) NOT NULL,
    `transfer_to_id` BIGINT NOT NULL,
    `start_date` DATE NULL,
    `advisor_create_new_client_flow_id` INTEGER NULL,
    `client_id` INTEGER NOT NULL,
    `advisor_id` INTEGER NOT NULL,
    `instruction_created` BOOLEAN NULL,
    `created_at` DATETIME(6) NOT NULL,
    `updated_at` DATETIME(6) NOT NULL,

    INDEX `fk_rails_02fe1ef5ce`(`advisor_create_new_client_flow_id`),
    INDEX `index_tr_instr_flows_on_transfer_from_type_and_transfer_from_id`(`transfer_from_type`, `transfer_from_id`),
    INDEX `index_tr_instr_flows_on_transfer_to_type_and_transfer_to_id`(`transfer_to_type`, `transfer_to_id`),
    INDEX `index_transfer_instruction_flows_on_advisor_id`(`advisor_id`),
    INDEX `index_transfer_instruction_flows_on_client_id`(`client_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `advisor_create_new_transfer_securities` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `advisor_create_new_transfer_flow_id` BIGINT NULL,
    `description` VARCHAR(255) NULL,
    `quantity` DECIMAL(17, 4) NULL,
    `created_at` DATETIME(6) NOT NULL,
    `updated_at` DATETIME(6) NOT NULL,

    INDEX `index_acn_transfer_securities_on_transfer_flow`(`advisor_create_new_transfer_flow_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `advisor_notification_subscriptions` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `advisor_id` INTEGER NOT NULL,
    `advisor_notification_id` INTEGER NOT NULL,
    `created_at` DATETIME(6) NOT NULL,
    `updated_at` DATETIME(6) NOT NULL,

    INDEX `index_advisor_notification_subscriptions_on_advisor_id`(`advisor_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `advisor_service_levels` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `group_id` INTEGER NOT NULL,
    `title` VARCHAR(255) NULL,
    `fees` VARCHAR(255) NULL,
    `description_md` TEXT NULL,
    `group_url_id_suffix` VARCHAR(255) NULL,
    `created_at` DATETIME(0) NULL,
    `updated_at` DATETIME(0) NULL,
    `hidden` BOOLEAN NOT NULL DEFAULT false,

    INDEX `index_advisor_service_levels_on_group_id`(`group_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `affiliates` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `allocations` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `fund_id` INTEGER NULL,
    `model_portfolio_id` INTEGER NULL,
    `weight` FLOAT NULL,
    `tolerance` FLOAT NULL,
    `created_at` DATETIME(0) NULL,
    `updated_at` DATETIME(0) NULL,
    `min_weight` FLOAT NULL,
    `max_weight` FLOAT NULL,

    INDEX `index_allocations_on_fund_id`(`fund_id`),
    INDEX `index_allocations_on_model_portfolio_id`(`model_portfolio_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `allotments` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `target` DECIMAL(10, 6) NULL,
    `adjusted` INTEGER NULL,
    `actual` INTEGER NULL,
    `position_id` INTEGER NOT NULL,
    `trade_id` INTEGER NOT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,
    `dollar_amount` DECIMAL(17, 4) NULL DEFAULT 0.0000,
    `status_id` INTEGER NULL DEFAULT 0,
    `potential_settlement_date` DATETIME(0) NULL,
    `account_id` INTEGER NULL,
    `fund_id` INTEGER NULL,

    INDEX `index_allotments_on_account_id`(`account_id`),
    INDEX `index_allotments_on_fund_id`(`fund_id`),
    INDEX `index_allotments_on_position_id`(`position_id`),
    INDEX `index_allotments_on_potential_settlement_date`(`potential_settlement_date`),
    INDEX `index_allotments_on_status_id`(`status_id`),
    INDEX `index_allotments_on_trade_id`(`trade_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `alternative_funds` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `can_sell` BOOLEAN NOT NULL,
    `allocation_id` INTEGER NOT NULL,
    `fund_id` INTEGER NOT NULL,
    `created_at` DATETIME(0) NULL,
    `updated_at` DATETIME(0) NULL,

    INDEX `index_alternative_funds_on_allocation_id`(`allocation_id`),
    INDEX `index_alternative_funds_on_fund_id`(`fund_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `application_read_models` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `account_id` INTEGER NULL,
    `advisor_create_new_account_flow_id` INTEGER NULL,
    `advisor_create_new_client_flow_id` INTEGER NULL,
    `user_id` INTEGER NOT NULL,
    `primary_advisor_user_id` INTEGER NULL,
    `sent_at` DATETIME(0) NULL,
    `started_at` DATETIME(0) NULL,
    `opened_at` DATETIME(0) NULL,
    `rejected_at` DATETIME(0) NULL,
    `application_status` VARCHAR(255) NULL,
    `account_status_id` INTEGER NULL,
    `status_id` INTEGER NULL,
    `type_id` INTEGER NULL,
    `portfolio_option_id` INTEGER NULL,
    `client_name` VARCHAR(255) NULL,
    `email` VARCHAR(255) NULL,
    `primary_advisor_name` VARCHAR(255) NULL,
    `search_terms` VARCHAR(255) NULL,
    `application_completed` BOOLEAN NULL,
    `created_at` DATETIME(6) NOT NULL,
    `updated_at` DATETIME(6) NOT NULL,

    INDEX `application_read_models_fulltext_index`(`search_terms`),
    INDEX `index_application_read_models_on_primary_advisor_user_id`(`primary_advisor_user_id`),
    INDEX `index_application_rm_on_account_flow_id`(`advisor_create_new_account_flow_id`),
    INDEX `index_application_rm_on_account_id`(`account_id`),
    INDEX `index_application_rm_on_client_flow_id`(`advisor_create_new_client_flow_id`),
    INDEX `index_application_rm_on_user_id`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ar_internal_metadata` (
    `key` VARCHAR(255) NOT NULL,
    `value` VARCHAR(255) NULL,
    `created_at` DATETIME(6) NOT NULL,
    `updated_at` DATETIME(6) NOT NULL,

    PRIMARY KEY (`key`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `assets_under_management_histories` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `date` DATE NOT NULL,
    `amount` DECIMAL(17, 2) NOT NULL,
    `group_id` INTEGER NOT NULL,
    `created_at` DATETIME(6) NOT NULL,
    `updated_at` DATETIME(6) NOT NULL,

    INDEX `index_assets_under_management_histories_on_group_id`(`group_id`),
    UNIQUE INDEX `index_assets_under_management_histories_on_date_and_group_id`(`date`, `group_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `audits` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `auditable_id` INTEGER NULL,
    `auditable_type` VARCHAR(255) NULL,
    `associated_id` INTEGER NULL,
    `associated_type` VARCHAR(255) NULL,
    `user_id` INTEGER NULL,
    `user_type` VARCHAR(255) NULL,
    `username` VARCHAR(255) NULL,
    `action` VARCHAR(255) NULL,
    `audited_changes` TEXT NULL,
    `version` INTEGER NULL DEFAULT 0,
    `comment` VARCHAR(255) NULL,
    `remote_address` VARCHAR(255) NULL,
    `request_uuid` VARCHAR(255) NULL,
    `created_at` DATETIME(0) NULL,

    INDEX `associated_index`(`associated_id`, `associated_type`),
    INDEX `auditable_index`(`auditable_id`, `auditable_type`),
    INDEX `index_audits_on_created_at`(`created_at`),
    INDEX `index_audits_on_request_uuid`(`request_uuid`),
    INDEX `user_index`(`user_id`, `user_type`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `authentication_factors` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `activation_date` DATETIME(0) NULL,
    `deactivation_date` DATETIME(0) NULL,
    `phone_number` VARCHAR(255) NULL,
    `contact_method` VARCHAR(255) NULL,
    `user_id` INTEGER NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `index_authentication_factors_on_user_id`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `balances` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `account_id` INTEGER NULL,
    `date` DATE NULL,
    `amount` DECIMAL(17, 2) NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `index_balances_on_account_id`(`account_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `bank_accounts` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `number` VARCHAR(255) NULL,
    `transit` VARCHAR(255) NULL,
    `bank_code` VARCHAR(255) NULL,
    `user_id` INTEGER NOT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,
    `verification_method_id` INTEGER NULL,
    `approved` BOOLEAN NOT NULL DEFAULT false,
    `status_id` INTEGER NOT NULL DEFAULT 0,
    `deactivated_at` DATETIME(0) NULL,
    `bank_name` VARCHAR(255) NULL,

    INDEX `index_bank_accounts_on_user_id`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `bbs_eod_activities` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `process_date_int` INTEGER NULL,
    `effective_date` INTEGER NULL,
    `account_number` VARCHAR(255) NULL,
    `client_name` VARCHAR(255) NULL,
    `transaction_id` VARCHAR(255) NULL,
    `sub_transaction_id` VARCHAR(255) NULL,
    `symbol` VARCHAR(255) NULL,
    `cusip` VARCHAR(255) NULL,
    `transaction_desc` VARCHAR(255) NULL,
    `transaction_type` VARCHAR(255) NULL,
    `quantity` DECIMAL(14, 4) NULL,
    `commission` DECIMAL(14, 4) NULL,
    `price` DECIMAL(14, 4) NULL,
    `accrued_interest` DECIMAL(14, 4) NULL,
    `amount_value` DECIMAL(14, 4) NULL,
    `security_type` VARCHAR(255) NULL,
    `currency` VARCHAR(255) NULL,
    `external_id` VARCHAR(255) NOT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    UNIQUE INDEX `index_bbs_eod_activities_on_external_id`(`external_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `bbs_eod_cashes` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `insert_date` DATE NULL,
    `account_number` VARCHAR(255) NULL,
    `full_name` VARCHAR(255) NULL,
    `currency_code` VARCHAR(255) NULL,
    `current_trade_date_balance` DECIMAL(14, 4) NULL,
    `current_settlement_date_balance` DECIMAL(14, 4) NULL,
    `market_value` DECIMAL(14, 4) NULL,
    `loan_value` DECIMAL(14, 4) NULL,
    `rtm_excess` DECIMAL(14, 4) NULL,
    `rts_equity` DECIMAL(14, 4) NULL,
    `account_type` VARCHAR(255) NULL,
    `external_id` VARCHAR(255) NOT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    UNIQUE INDEX `index_bbs_eod_cashes_on_external_id`(`external_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `bbs_eod_positions` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `account` VARCHAR(255) NULL,
    `cusip` VARCHAR(255) NULL,
    `symbol` VARCHAR(255) NULL,
    `security_type` VARCHAR(255) NULL,
    `country_code` VARCHAR(255) NULL,
    `currency` VARCHAR(255) NULL,
    `quantity` DECIMAL(14, 6) NULL,
    `price` DECIMAL(14, 6) NULL,
    `strike_price` DECIMAL(14, 6) NULL,
    `call_or_put` VARCHAR(255) NULL,
    `expiration_date` DATE NULL,
    `book_value` DECIMAL(14, 4) NULL,
    `external_id` VARCHAR(255) NOT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    UNIQUE INDEX `index_bbs_eod_positions_on_external_id`(`external_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `beneficiaries` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `personal_relation_id` INTEGER NOT NULL,
    `account_id` INTEGER NOT NULL,
    `user_id` INTEGER NULL,
    `primary_caregiver_id` INTEGER NULL,
    `primary_caregiver_other` BOOLEAN NOT NULL DEFAULT false,
    `legal_guardian_id` INTEGER NULL,
    `legal_guardian_other` BOOLEAN NOT NULL DEFAULT false,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,
    `type` VARCHAR(255) NULL,
    `percent` DECIMAL(5, 2) NULL,

    INDEX `fk_rails_301a671b2c`(`primary_caregiver_id`),
    INDEX `fk_rails_8e784869b5`(`legal_guardian_id`),
    INDEX `index_beneficiaries_on_account_id`(`account_id`),
    INDEX `index_beneficiaries_on_personal_relation_id`(`personal_relation_id`),
    INDEX `index_beneficiaries_on_user_id`(`user_id`),
    UNIQUE INDEX `index_beneficiaries_on_personal_relation_id_and_account_id`(`personal_relation_id`, `account_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `branches` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `code` VARCHAR(255) NULL,
    `name` VARCHAR(255) NULL,
    `created_at` DATETIME(6) NOT NULL,
    `updated_at` DATETIME(6) NOT NULL,

    INDEX `index_branches_on_code`(`code`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `brokerage_accounts` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `firm_name` VARCHAR(255) NULL,
    `number` VARCHAR(255) NULL,
    `user_id` INTEGER NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `index_brokerage_accounts_on_user_id`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `charges` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `category_id` INTEGER NOT NULL,
    `amount` DECIMAL(17, 4) NOT NULL,
    `date` DATE NOT NULL,
    `account_id` INTEGER NOT NULL,
    `related_to_id` INTEGER NULL,
    `related_to_type` VARCHAR(255) NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `index_charges_on_account_id`(`account_id`),
    INDEX `index_charges_on_related_to_type_and_related_to_id`(`related_to_type`, `related_to_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `choices` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `label` VARCHAR(255) NULL,
    `value` VARCHAR(255) NULL,
    `description` VARCHAR(255) NULL,
    `order` INTEGER NULL,
    `question_id` INTEGER NULL,
    `created_at` DATETIME(0) NULL,
    `updated_at` DATETIME(0) NULL,

    INDEX `index_choices_on_question_id`(`question_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `client_advisor_assignment_flows` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `client_id` INTEGER NOT NULL,
    `group_id` INTEGER NOT NULL,
    `ima_doc_id` INTEGER NOT NULL,
    `effective_date` DATETIME(0) NULL,
    `created_at` DATETIME(6) NOT NULL,
    `updated_at` DATETIME(6) NOT NULL,

    INDEX `index_client_advisor_assignment_flows_on_client_id`(`client_id`),
    INDEX `index_client_advisor_assignment_flows_on_group_id`(`group_id`),
    INDEX `index_client_advisor_assignment_flows_on_ima_doc_id`(`ima_doc_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `client_advisor_assignments` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `client_id` INTEGER NULL,
    `note` VARCHAR(255) NULL,
    `effective_date` DATE NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `fk_rails_940fee5a73`(`client_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `client_read_models` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `person_id` INTEGER NULL,
    `first_name` VARCHAR(255) NULL,
    `last_name` VARCHAR(255) NULL,
    `since` DATETIME(0) NULL,
    `email` VARCHAR(255) NULL,
    `balance` DECIMAL(17, 2) NULL,
    `last_kyc` DATETIME(0) NULL,
    `calculated_fee_level` FLOAT NULL,
    `search_terms` VARCHAR(255) NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    UNIQUE INDEX `index_client_read_models_on_person_id`(`person_id`),
    INDEX `client_read_models_fulltext_index`(`search_terms`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `co_brand_infos` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `url_id` VARCHAR(255) NOT NULL,
    `name` VARCHAR(255) NULL,
    `cobrand` VARCHAR(255) NULL,
    `cobrand_logo` VARCHAR(255) NULL,
    `header_image` VARCHAR(255) NULL,
    `landing_page` VARCHAR(255) NULL,
    `institution_prefix` VARCHAR(255) NULL,
    `created_at` DATETIME(6) NOT NULL,
    `updated_at` DATETIME(6) NOT NULL,

    UNIQUE INDEX `index_co_brand_infos_on_url_id`(`url_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `companies` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `completed_risk_appetite_quizzes` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `completed_at` DATETIME(0) NOT NULL,
    `risk_appetite_quiz_id` INTEGER NOT NULL,
    `person_id` INTEGER NOT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `index_completed_risk_appetite_quizzes_on_person_id`(`person_id`),
    INDEX `index_completed_risk_appetite_quizzes_on_risk_appetite_quiz_id`(`risk_appetite_quiz_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `contribution_amounts` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `percent` DECIMAL(5, 2) NULL,
    `dollar_amount` DECIMAL(10, 0) NULL,
    `effective_date` DATE NOT NULL,
    `account_id` INTEGER NOT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `index_contribution_amounts_on_account_id`(`account_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `csi_eod_accounts` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `client_id` VARCHAR(255) NULL,
    `account_number` VARCHAR(255) NULL,
    `account_short_name` VARCHAR(255) NULL,
    `acct_type` INTEGER NULL,
    `acct_sub_type` VARCHAR(255) NULL,
    `acct_class` INTEGER NULL,
    `fund_type` VARCHAR(255) NULL,
    `status` VARCHAR(255) NULL,
    `trades_ok` VARCHAR(255) NULL,
    `market_val` DECIMAL(17, 4) NULL,
    `loan_val` DECIMAL(17, 4) NULL,
    `file_date` DATE NULL,
    `external_id` VARCHAR(255) NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,
    `settled_cash` DECIMAL(17, 4) NULL,

    UNIQUE INDEX `index_csi_eod_accounts_on_external_id`(`external_id`),
    INDEX `index_csi_eod_accounts_on_file_date`(`file_date`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `csi_eod_clients` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `client_id` VARCHAR(255) NULL,
    `first_name` VARCHAR(255) NULL,
    `last_name` VARCHAR(255) NULL,
    `birth_date` DATE NULL,
    `open_date` DATE NULL,
    `close_date` DATE NULL,
    `sin` VARCHAR(255) NULL,
    `sps_birth_date` DATE NULL,
    `sps_name` VARCHAR(255) NULL,
    `sps_sin` VARCHAR(255) NULL,
    `recipient_type` INTEGER NULL,
    `residence` INTEGER NULL,
    `status` VARCHAR(255) NULL,
    `branch` VARCHAR(255) NULL,
    `citizen_iso` VARCHAR(255) NULL,
    `file_date` DATE NULL,
    `external_id` VARCHAR(255) NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    UNIQUE INDEX `index_csi_eod_clients_on_external_id`(`external_id`),
    INDEX `index_csi_eod_clients_on_file_date`(`file_date`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `csi_eod_positions` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `account_number` VARCHAR(255) NULL,
    `security_description` VARCHAR(255) NULL,
    `security_fund_type` VARCHAR(255) NULL,
    `cusip` VARCHAR(255) NULL,
    `end_of_day_positions` DATE NULL,
    `quantity` DECIMAL(17, 4) NULL,
    `market_value` DECIMAL(17, 4) NULL,
    `cur_cost` DECIMAL(17, 4) NULL,
    `loan_val` DECIMAL(17, 4) NULL,
    `file_date` DATE NULL,
    `external_id` VARCHAR(255) NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    UNIQUE INDEX `index_csi_eod_positions_on_external_id`(`external_id`),
    INDEX `index_eod_positions_date_account_number`(`end_of_day_positions`, `account_number`),
    INDEX `index_eod_positions_date_cusip`(`end_of_day_positions`, `cusip`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `csi_eod_settled_positions` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `account_number` VARCHAR(255) NULL,
    `security_description` VARCHAR(255) NULL,
    `security_fund_type` VARCHAR(255) NULL,
    `cusip` VARCHAR(255) NULL,
    `end_of_day_positions` DATE NULL,
    `quantity` DECIMAL(17, 4) NULL,
    `market_value` DECIMAL(17, 4) NULL,
    `cur_cost` DECIMAL(17, 4) NULL,
    `loan_val` DECIMAL(17, 4) NULL,
    `file_date` DATE NULL,
    `external_id` VARCHAR(255) NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,
    `client_id` VARCHAR(255) NULL,
    `branch` VARCHAR(255) NULL,
    `rr` VARCHAR(255) NULL,

    UNIQUE INDEX `index_csi_eod_settled_positions_on_external_id`(`external_id`),
    INDEX `index_eod_settled_positions_date_account_number`(`end_of_day_positions`, `account_number`),
    INDEX `index_eod_settled_positions_date_cusip`(`end_of_day_positions`, `cusip`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `csi_eod_trailer_shares` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `account_number` VARCHAR(255) NULL,
    `cusip` VARCHAR(255) NULL,
    `mgt_company` VARCHAR(255) NULL,
    `fund_type` VARCHAR(255) NULL,
    `trailer` DECIMAL(17, 4) NULL,
    `rep_code` VARCHAR(255) NULL,
    `process_date` DATE NULL,
    `trailer_share` DECIMAL(17, 4) NULL,
    `external_id` VARCHAR(255) NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    UNIQUE INDEX `index_csi_eod_trailer_shares_on_external_id`(`external_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `csi_eod_transactions` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `account_number` VARCHAR(255) NULL,
    `transaction_code` VARCHAR(255) NULL,
    `security_class` VARCHAR(255) NULL,
    `security_description` VARCHAR(255) NULL,
    `description` VARCHAR(255) NULL,
    `cusip` VARCHAR(255) NULL,
    `trade_date` DATE NULL,
    `settle_date` DATE NULL,
    `process_date` DATE NULL,
    `quantity` DECIMAL(17, 4) NULL,
    `amount` DECIMAL(17, 4) NULL,
    `fund_type` VARCHAR(255) NULL,
    `cost` DECIMAL(17, 4) NULL,
    `exchange_rate` DECIMAL(17, 4) NULL,
    `rr` VARCHAR(255) NULL,
    `file_date` DATE NULL,
    `unit_price` DECIMAL(17, 5) NULL,
    `commission` DECIMAL(17, 4) NULL,
    `tax` DECIMAL(17, 4) NULL,
    `accrued_int` DECIMAL(17, 4) NULL,
    `fees` DECIMAL(17, 4) NULL,
    `cancelled` VARCHAR(255) NULL,
    `external_id` VARCHAR(255) NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,
    `manual_cancel` BOOLEAN NULL,

    UNIQUE INDEX `index_csi_eod_transactions_on_external_id`(`external_id`),
    INDEX `index_eod_transactions_account_number_settle_date`(`account_number`, `settle_date`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `custodians` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NULL,
    `code` VARCHAR(255) NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `dataphile_records` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `request_payload` TEXT NULL,
    `response` TEXT NULL,
    `account_id` INTEGER NULL,
    `created_at` DATETIME(6) NOT NULL,
    `updated_at` DATETIME(6) NOT NULL,

    INDEX `index_dataphile_records_on_account_id`(`account_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `delayed_job_groups` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `on_completion_job` TEXT NULL,
    `on_completion_job_options` TEXT NULL,
    `on_cancellation_job` TEXT NULL,
    `on_cancellation_job_options` TEXT NULL,
    `failure_cancels_group` BOOLEAN NOT NULL DEFAULT true,
    `queueing_complete` BOOLEAN NOT NULL DEFAULT false,
    `blocked` BOOLEAN NOT NULL DEFAULT false,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `delayed_jobs` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `priority` INTEGER NOT NULL DEFAULT 0,
    `attempts` INTEGER NOT NULL DEFAULT 0,
    `handler` TEXT NOT NULL,
    `last_error` TEXT NULL,
    `run_at` DATETIME(0) NULL,
    `locked_at` DATETIME(0) NULL,
    `failed_at` DATETIME(0) NULL,
    `locked_by` VARCHAR(255) NULL,
    `queue` VARCHAR(255) NULL,
    `created_at` DATETIME(0) NULL,
    `updated_at` DATETIME(0) NULL,
    `blocked` BOOLEAN NOT NULL DEFAULT false,
    `job_group_id` INTEGER NULL,

    INDEX `delayed_jobs_priority`(`priority`, `run_at`),
    INDEX `index_delayed_jobs_on_job_group_id`(`job_group_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `dependencies` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `on` VARCHAR(255) NULL,
    `operator` VARCHAR(255) NULL,
    `value` VARCHAR(255) NULL,
    `question_id` INTEGER NOT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `index_dependencies_on_question_id`(`question_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `document_processing_results` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `document_id` INTEGER NOT NULL,
    `results` VARCHAR(255) NULL,
    `messages` VARCHAR(255) NULL,
    `status` VARCHAR(255) NULL,
    `started_at` DATETIME(0) NULL,
    `finished_at` DATETIME(0) NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `index_document_processing_results_on_document_id`(`document_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `documents` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `adc_key` VARCHAR(255) NULL,
    `aws_key` VARCHAR(255) NULL,
    `type_id` INTEGER NULL,
    `signed_at` DATETIME(0) NULL,
    `approved_at` DATETIME(0) NULL,
    `user_id` INTEGER NOT NULL,
    `related_to_id` INTEGER NOT NULL,
    `related_to_type` VARCHAR(255) NOT NULL,
    `http_user` VARCHAR(255) NULL,
    `http_pass` VARCHAR(255) NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,
    `widget_id` VARCHAR(255) NULL,
    `widget_url` VARCHAR(255) NULL,
    `widget_redirect_received_at` DATETIME(0) NULL,
    `description` VARCHAR(255) NULL,
    `external_document_id` TEXT NULL,

    UNIQUE INDEX `index_documents_on_external_document_id`(`external_document_id`(500)),
    INDEX `index_documents_on_related_to_type_and_related_to_id`(`related_to_type`, `related_to_id`),
    INDEX `index_documents_on_user_id`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `enum_values` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `type` VARCHAR(255) NULL,
    `vid` INTEGER NULL,
    `name` VARCHAR(255) NULL,
    `label` VARCHAR(255) NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    UNIQUE INDEX `index_enum_values_on_type_and_vid`(`type`, `vid`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `eod_files` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `filename` VARCHAR(255) NULL,
    `file_type` VARCHAR(255) NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    UNIQUE INDEX `index_eod_files_on_filename`(`filename`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `external_advisor_services` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `group_id` INTEGER NULL,
    `service_index` INTEGER NULL,
    `service` TEXT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `index_external_advisor_services_on_group_id`(`group_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `external_identity_checks` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `person_id` INTEGER NULL,
    `completed_at` DATETIME(0) NOT NULL,
    `identity_verified` BOOLEAN NOT NULL,
    `credit_file_reference_id` VARCHAR(255) NULL,
    `request_body` TEXT NOT NULL,
    `response_body` TEXT NOT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,
    `service_id` INTEGER NOT NULL,
    `personal_info_input` TEXT NOT NULL,
    `results` TEXT NOT NULL,

    INDEX `index_external_identity_checks_on_person_id`(`person_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `fcc_audit_records` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `request` TEXT NULL,
    `response` TEXT NULL,
    `request_id` VARCHAR(255) NULL,
    `related_to_type` VARCHAR(255) NULL,
    `related_to_id` BIGINT NULL,
    `created_at` DATETIME(6) NOT NULL,
    `updated_at` DATETIME(6) NOT NULL,

    INDEX `index_fcc_audit_records_on_related_to_type_and_related_to_id`(`related_to_type`, `related_to_id`),
    INDEX `index_fcc_audit_records_on_request_id`(`request_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `fee_credit_accounts` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `person_id` INTEGER NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `index_fee_credit_accounts_on_person_id`(`person_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `fee_credit_transactions` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `amount` DECIMAL(17, 2) NULL,
    `date` DATE NULL,
    `added_by_id` INTEGER NULL,
    `notes` TEXT NULL,
    `fee_credit_account_id` INTEGER NULL,
    `related_to_id` INTEGER NULL,
    `related_to_type` VARCHAR(255) NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `fk_rails_51df9d9508`(`added_by_id`),
    INDEX `index_fee_credit_transactions_on_fee_credit_account_id`(`fee_credit_account_id`),
    INDEX `index_fee_credit_transactions_on_related_to_type_and_id`(`related_to_type`, `related_to_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `fee_schedule_assignments` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `fee_schedule_id` INTEGER NOT NULL,
    `user_id` INTEGER NOT NULL,
    `notes` VARCHAR(255) NULL,
    `effective_date` DATE NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `fk_rails_6938abcec5`(`fee_schedule_id`),
    INDEX `fk_rails_e6d442b880`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `fee_schedules` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `code` VARCHAR(32) NULL,
    `name` VARCHAR(255) NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,
    `marginal` BOOLEAN NOT NULL DEFAULT false,

    UNIQUE INDEX `index_fee_schedules_on_code`(`code`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `fee_tiers` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `minimum` DECIMAL(10, 2) NULL,
    `fee` DECIMAL(10, 2) NULL,
    `trailer_fee` DECIMAL(10, 2) NULL,
    `fee_schedule_id` INTEGER NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,
    `flat_fee` DECIMAL(10, 2) NULL,
    `ma_rl1_core_fee` DECIMAL(10, 2) NULL,
    `ma_rl1_adaptive_fee` DECIMAL(10, 2) NULL,
    `ma_rl2_10_core_fee` DECIMAL(10, 2) NULL,
    `ma_rl2_10_adaptive_fee` DECIMAL(10, 2) NULL,
    `ma_non_resp_min_monthly_fee` DECIMAL(10, 2) NULL,
    `ma_resp_min_monthly_fee` DECIMAL(10, 2) NULL,
    `ma_maximum_fee` DECIMAL(10, 2) NULL,

    INDEX `fee_tiers_fee_schedule_minimum_idx`(`fee_schedule_id`, `minimum`),
    INDEX `index_fee_tiers_on_fee_schedule_id`(`fee_schedule_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `fillable_pdf_form_parameters` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `params` TEXT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `financial_interests` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `account_id` BIGINT NULL,
    `personal_relation_id` BIGINT NULL,

    INDEX `index_financial_interests_on_account_id`(`account_id`),
    INDEX `index_financial_interests_on_personal_relation_id`(`personal_relation_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `fund_accounts` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `fund_id` INTEGER NULL,
    `account_id` INTEGER NULL,
    `number` VARCHAR(255) NULL,
    `created_at` DATETIME(6) NOT NULL,
    `updated_at` DATETIME(6) NOT NULL,

    INDEX `index_fund_accounts_on_account_id`(`account_id`),
    INDEX `index_fund_accounts_on_fund_id`(`fund_id`),
    UNIQUE INDEX `index_fund_accounts_on_account_id_and_fund_id`(`account_id`, `fund_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `funds` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `symbol` VARCHAR(255) NULL,
    `cusip` VARCHAR(255) NULL,
    `label` VARCHAR(255) NULL,
    `asset_description` VARCHAR(255) NULL,
    `asset_type_id` INTEGER NULL,
    `asset_region_id` INTEGER NULL,
    `asset_term_id` INTEGER NULL,
    `fee` FLOAT NULL,
    `created_at` DATETIME(0) NULL,
    `updated_at` DATETIME(0) NULL,
    `ask` DECIMAL(11, 5) NULL,
    `bid` DECIMAL(11, 5) NULL,
    `last_trade` DECIMAL(11, 5) NULL,
    `volume` INTEGER NULL,
    `last_trade_time` DATETIME(0) NULL,
    `usd` BOOLEAN NULL DEFAULT false,
    `asset_class_id` INTEGER NOT NULL,
    `initial_purchase` DECIMAL(10, 4) NULL DEFAULT 0.0000,
    `subsequent_purchase` DECIMAL(10, 4) NULL DEFAULT 0.0000,
    `settlement_delay` INTEGER NULL DEFAULT 0,

    INDEX `index_funds_on_cusip`(`cusip`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `goals` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER NULL,
    `label` VARCHAR(255) NULL,
    `description` VARCHAR(255) NULL,
    `timeframe` FLOAT NULL,
    `notimeframe` BOOLEAN NULL,
    `initial` DECIMAL(17, 2) NULL,
    `ongoing` DECIMAL(17, 2) NULL,
    `unpredictable` BOOLEAN NULL,
    `risk_offset` INTEGER NULL,
    `risk_recommendation` INTEGER NULL,
    `created_at` DATETIME(0) NULL,
    `updated_at` DATETIME(0) NULL,
    `advisor_risk_offset` INTEGER NULL,
    `target_amount` DECIMAL(17, 2) NULL,
    `raw_risk_recommendation` FLOAT NULL,

    INDEX `index_goals_on_user_id`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `group_members` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `group_id` INTEGER NULL,
    `user_id` INTEGER NULL,
    `role` VARCHAR(255) NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `index_group_members_on_group_id`(`group_id`),
    INDEX `index_group_members_on_user_id`(`user_id`),
    UNIQUE INDEX `index_group_members_on_user_id_and_group_id_and_role`(`user_id`, `group_id`, `role`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `group_savings_plans` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `invite_url` VARCHAR(255) NULL,
    `company_id` INTEGER NOT NULL,
    `group_id` INTEGER NOT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    UNIQUE INDEX `index_group_savings_plans_on_invite_url`(`invite_url`),
    UNIQUE INDEX `index_group_savings_plans_on_group_id`(`group_id`),
    INDEX `index_group_savings_plans_on_company_id`(`company_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `groups` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `parent_id` INTEGER NULL,
    `name` VARCHAR(255) NULL,
    `path` VARCHAR(255) NULL,
    `url_id` VARCHAR(255) NULL,
    `group_type` VARCHAR(255) NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,
    `ima_template` VARCHAR(255) NULL,
    `fee_schedule_id` INTEGER NULL,
    `prevent_prefill` BOOLEAN NULL,
    `preferred_institution_name` VARCHAR(255) NULL,
    `prevent_prefill_portfolio_option` BOOLEAN NULL,
    `days_until_client_info_stale` INTEGER NULL DEFAULT 30,

    UNIQUE INDEX `index_groups_on_url_id`(`url_id`),
    INDEX `fk_rails_d81b249d13`(`fee_schedule_id`),
    INDEX `groups_parent_id_foreign_key`(`parent_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `household_invitations` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `invitee_email` VARCHAR(255) NOT NULL,
    `relationship_id` INTEGER NOT NULL,
    `status_id` INTEGER NOT NULL,
    `person_id` INTEGER NOT NULL,
    `household_id` INTEGER NOT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `index_household_invitations_on_household_id`(`household_id`),
    INDEX `index_household_invitations_on_invitee_email`(`invitee_email`),
    INDEX `index_household_invitations_on_person_id`(`person_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `household_memberships` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `household_id` INTEGER NULL,
    `person_id` INTEGER NULL,
    `role_id` INTEGER NOT NULL,
    `status_id` INTEGER NOT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    UNIQUE INDEX `index_household_memberships_on_person_id`(`person_id`),
    INDEX `index_household_memberships_on_household_id`(`household_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `households` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `insider_roles` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `person_id` INTEGER NOT NULL,
    `company` VARCHAR(255) NULL,
    `ticker` VARCHAR(255) NULL,
    `type_id` INTEGER NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,
    `ownership_level_id` INTEGER NULL,
    `market_id` INTEGER NULL,

    INDEX `index_insider_roles_on_person_id`(`person_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `investment_management_agreements` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER NOT NULL,
    `url` VARCHAR(255) NULL,
    `adc_key` VARCHAR(255) NULL,
    `aws_key` VARCHAR(255) NULL,
    `signed_at` DATETIME(0) NULL,
    `approved_at` DATETIME(0) NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `index_investment_management_agreements_on_user_id`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `investment_policy_statements` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `account_id` INTEGER NOT NULL,
    `url` VARCHAR(255) NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `index_investment_policy_statements_on_account_id`(`account_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `invitation_links` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `client_advisor_assignment_id` INTEGER NULL,
    `advisor_service_level_id` INTEGER NULL,
    `group_url_id` VARCHAR(255) NULL,
    `link` VARCHAR(255) NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `index_invitation_links_on_link`(`link`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `issue_comments` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `issue_id` INTEGER NULL,
    `created_by_id` INTEGER NULL,
    `body` TEXT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `index_issue_comments_on_created_by_id`(`created_by_id`),
    INDEX `index_issue_comments_on_issue_id`(`issue_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `issues` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `description` VARCHAR(255) NULL,
    `priority` INTEGER NULL,
    `related_to_id` INTEGER NULL,
    `related_to_type` VARCHAR(255) NULL,
    `created_by_id` INTEGER NULL,
    `assigned_to_id` INTEGER NULL,
    `closed_at` DATETIME(0) NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,
    `type_id` INTEGER NOT NULL DEFAULT 5,

    INDEX `index_issues_on_assigned_to_id`(`assigned_to_id`),
    INDEX `index_issues_on_created_by_id`(`created_by_id`),
    INDEX `index_issues_on_related_to_type_and_related_to_id`(`related_to_type`, `related_to_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `jobs` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `active_job_id` VARCHAR(255) NULL,
    `class_name` VARCHAR(255) NULL,
    `queue_name` VARCHAR(255) NULL,
    `arguments` VARCHAR(8192) NULL,
    `started_at` DATETIME(0) NULL,
    `finished_at` DATETIME(0) NULL,
    `error` VARCHAR(255) NULL,
    `status_id` INTEGER NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `joint_applicants` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(255) NOT NULL,
    `account_id` INTEGER NOT NULL,
    `person_id` INTEGER NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `index_joint_applicants_on_account_id`(`account_id`),
    INDEX `index_joint_applicants_on_person_id`(`person_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `know_your_clients` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER NOT NULL,
    `url` VARCHAR(255) NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `index_know_your_clients_on_user_id`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `kyc_updates` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER NOT NULL,
    `due_date` DATE NULL,
    `deadline` DATE NULL,
    `completed` BOOLEAN NULL,
    `confirmed_steps_txt` TEXT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,
    `completed_at` DATETIME(0) NULL,

    INDEX `index_kyc_updates_on_user_id`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `leads` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(255) NOT NULL,
    `phone_number` VARCHAR(255) NOT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,
    `first_name` VARCHAR(255) NOT NULL,
    `last_name` VARCHAR(255) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `legal_infos` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `is_pep_or_hio` BOOLEAN NULL,
    `person_id` INTEGER NOT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,
    `dealer_position` VARCHAR(255) NULL,
    `foreign_country` VARCHAR(255) NULL,
    `funds_source` VARCHAR(255) NULL,
    `family_member_is_pep_or_hio` BOOLEAN NULL,
    `state_relationship` VARCHAR(255) NULL,
    `dealer_company` VARCHAR(255) NULL,
    `advisor_interest_detail` VARCHAR(255) NULL,

    UNIQUE INDEX `index_legal_infos_on_person_id`(`person_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `legal_residencies` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `person_id` INTEGER NULL,
    `residence` VARCHAR(255) NULL,
    `created_at` DATETIME(6) NOT NULL,
    `updated_at` DATETIME(6) NOT NULL,

    INDEX `index_legal_residencies_on_person_id`(`person_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `manual_identity_checks` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `person_id` INTEGER NOT NULL,
    `inspector_id` INTEGER NOT NULL,
    `completed_at` DATETIME(0) NOT NULL,
    `identity_verified` BOOLEAN NOT NULL,
    `notes` TEXT NOT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `index_manual_identity_checks_on_inspector_id`(`inspector_id`),
    INDEX `index_manual_identity_checks_on_person_id`(`person_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `model_portfolios` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `label` VARCHAR(255) NULL,
    `description` VARCHAR(255) NULL,
    `taxable` BOOLEAN NULL,
    `risk` INTEGER NULL,
    `created_at` DATETIME(0) NULL,
    `updated_at` DATETIME(0) NULL,
    `responsible` BOOLEAN NOT NULL,
    `portfolio_option_id` INTEGER NOT NULL DEFAULT 0,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `notes` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `text` TEXT NULL,
    `person_id` INTEGER NULL,
    `account_id` INTEGER NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `index_notes_on_account_id`(`account_id`),
    INDEX `index_notes_on_person_id`(`person_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `notifications` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `description` VARCHAR(255) NULL,
    `related_to_id` INTEGER NULL,
    `related_to_type` VARCHAR(255) NULL,
    `seen_at` DATETIME(0) NULL,
    `user_id` INTEGER NOT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `index_notifications_on_related_to_type_and_related_to_id`(`related_to_type`, `related_to_id`),
    INDEX `index_notifications_on_user_id`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `one_time_passwords` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER NULL,
    `expires_at` DATETIME(0) NULL,
    `one_time_username` VARCHAR(255) NULL,
    `one_time_password` VARCHAR(255) NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,
    `sent_by_id` INTEGER NULL,
    `notes` TEXT NULL,

    INDEX `index_one_time_passwords_on_sent_by_id`(`sent_by_id`),
    INDEX `index_one_time_passwords_on_user_id`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `orders` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `trades_approved_at` DATETIME(0) NULL,
    `trades_received_at` DATETIME(0) NULL,
    `trades_confirmed_at` DATETIME(0) NULL,
    `allotments_approved_at` DATETIME(0) NULL,
    `allotments_received_at` DATETIME(0) NULL,
    `allotments_confirmed_at` DATETIME(0) NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,
    `rebalancing_finished_at` DATETIME(0) NULL,
    `canceled` BOOLEAN NULL DEFAULT false,
    `paused` BOOLEAN NULL DEFAULT false,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `participants` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `person_id` INTEGER NOT NULL,
    `account_id` INTEGER NOT NULL,
    `type_id` INTEGER NULL,
    `created_at` DATETIME(0) NULL,
    `updated_at` DATETIME(0) NULL,

    INDEX `index_participants_on_account_id`(`account_id`),
    INDEX `index_participants_on_person_id`(`person_id`),
    UNIQUE INDEX `index_participants_on_person_id_and_account_id_and_type_id`(`person_id`, `account_id`, `type_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `people` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `first_name` VARCHAR(255) NULL,
    `middle_name` VARCHAR(255) NULL,
    `last_name` VARCHAR(255) NULL,
    `birth_date` DATE NULL,
    `residence` VARCHAR(255) NULL,
    `citizenship` VARCHAR(255) NULL,
    `place_of_birth` VARCHAR(255) NULL,
    `sin` VARCHAR(255) NULL,
    `ssn` VARCHAR(255) NULL,
    `us_tax_resident` BOOLEAN NULL,
    `employer` VARCHAR(255) NULL,
    `occupation` VARCHAR(255) NULL,
    `gender_id` INTEGER NULL,
    `employment_status_id` INTEGER NULL,
    `marital_status_id` INTEGER NULL,
    `user_id` INTEGER NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,
    `preferred_title` VARCHAR(255) NULL,
    `has_foreign_tax_status` BOOLEAN NULL,
    `num_dependents` INTEGER NULL DEFAULT 0,
    `employer_type` VARCHAR(255) NULL,
    `pro` BOOLEAN NULL DEFAULT false,
    `total_annual_income` INTEGER NULL,
    `own_external_assets` BOOLEAN NULL,
    `registered_equities` INTEGER NULL,
    `registered_income` INTEGER NULL,
    `registered_cash` INTEGER NULL,
    `non_registered_income` INTEGER NULL,
    `non_registered_equities` INTEGER NULL,
    `non_registered_cash` INTEGER NULL,
    `trusted_contact_designated` BOOLEAN NULL,

    INDEX `index_people_on_user_id`(`user_id`),
    INDEX `people_name_fulltext_index`(`first_name`, `middle_name`, `last_name`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `performance_summaries` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `account_id` INTEGER NOT NULL,
    `ytdRoi` DECIMAL(17, 8) NULL,
    `sinceInception` DECIMAL(17, 8) NULL,
    `annualizedRoi` DECIMAL(17, 8) NULL,
    `firstQuarter` DECIMAL(17, 8) NULL,
    `secondQuarter` DECIMAL(17, 8) NULL,
    `thirdQuarter` DECIMAL(17, 8) NULL,
    `fourthQuarter` DECIMAL(17, 8) NULL,
    `previous3Months` DECIMAL(17, 8) NULL,
    `previous6Months` DECIMAL(17, 8) NULL,
    `previous9Months` DECIMAL(17, 8) NULL,
    `previous12Months` DECIMAL(17, 8) NULL,
    `previous3Years` DECIMAL(17, 8) NULL,
    `previous5Years` DECIMAL(17, 8) NULL,
    `previous10Years` DECIMAL(17, 8) NULL,
    `annualized3Year` DECIMAL(17, 8) NULL,
    `annualized5Year` DECIMAL(17, 8) NULL,
    `annualized10Year` DECIMAL(17, 8) NULL,
    `created_at` DATETIME(6) NOT NULL,
    `updated_at` DATETIME(6) NOT NULL,

    INDEX `index_performance_summaries_on_account_id`(`account_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `personal_relations` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `person_id` INTEGER NOT NULL,
    `relative_id` INTEGER NOT NULL,
    `type_id` INTEGER NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,
    `other_relation_name` VARCHAR(255) NULL,

    INDEX `index_personal_relations_on_person_id`(`person_id`),
    INDEX `index_personal_relations_on_relative_id`(`relative_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `phone_numbers` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `same_as_id` INTEGER NULL,
    `contact_id` INTEGER NULL,
    `contact_type` VARCHAR(255) NULL,
    `country_code` VARCHAR(255) NULL,
    `area_code` VARCHAR(255) NULL,
    `exchange_code` VARCHAR(255) NULL,
    `station_code` VARCHAR(255) NULL,
    `extension` VARCHAR(255) NULL,
    `type_id` INTEGER NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `fk_rails_0d1ef54944`(`same_as_id`),
    INDEX `index_phone_numbers_on_contact_type_and_contact_id`(`contact_type`, `contact_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `platforms` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `created_at` DATETIME(6) NOT NULL,
    `updated_at` DATETIME(6) NOT NULL,

    UNIQUE INDEX `index_platforms_on_name`(`name`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `portfolio_tactical_allocation_targets` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `portfolio_tactical_target_id` INTEGER NOT NULL,
    `allocation_id` INTEGER NOT NULL,
    `tactical_weight` FLOAT NOT NULL,
    `created_at` DATETIME(0) NULL,
    `updated_at` DATETIME(0) NULL,

    INDEX `ind_portfolio_tactical_allocation_targets_fk`(`portfolio_tactical_target_id`),
    INDEX `index_portfolio_tactical_allocation_targets_on_allocation_id`(`allocation_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `portfolio_tactical_targets` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `model_portfolio_id` INTEGER NOT NULL,
    `start_date` DATE NOT NULL,
    `created_at` DATETIME(0) NULL,
    `updated_at` DATETIME(0) NULL,

    INDEX `index_portfolio_tactical_targets_on_model_portfolio_id`(`model_portfolio_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `positions` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `fund_id` INTEGER NOT NULL,
    `account_id` INTEGER NOT NULL,
    `shares` DECIMAL(17, 6) NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,
    `market_value` DECIMAL(17, 2) NULL,

    INDEX `index_positions_on_account_id`(`account_id`),
    INDEX `index_positions_on_fund_id`(`fund_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `preferred_custodians` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `person_id` INTEGER NOT NULL,
    `custodian_id` INTEGER NOT NULL,

    UNIQUE INDEX `index_preferred_custodians_on_person_id`(`person_id`),
    INDEX `index_preferred_custodians_on_custodian_id`(`custodian_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `profiles` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(255) NULL,
    `full_name` VARCHAR(255) NULL,
    `phone_number` VARCHAR(255) NULL,
    `email_address` VARCHAR(255) NULL,
    `portrait_url` VARCHAR(255) NULL,
    `user_id` INTEGER NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,
    `promotional_fee` FLOAT NULL,
    `promotion_id` INTEGER NULL,
    `hubspot_url` VARCHAR(255) NULL,

    INDEX `fk_rails_c67ac8f59c`(`promotion_id`),
    INDEX `index_profiles_on_user_id`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `promotion_details` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `type` VARCHAR(255) NULL,
    `amount` DECIMAL(10, 2) NULL,
    `discounted_amount` DECIMAL(10, 2) NULL,
    `duration` INTEGER NULL,
    `funding_minimum` DECIMAL(10, 2) NULL,
    `redemption_delay` INTEGER NULL,
    `promotion_id` INTEGER NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `index_promotion_details_on_promotion_id`(`promotion_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `promotion_redemptions` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER NOT NULL,
    `promotion_id` INTEGER NOT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,
    `effective_date` DATE NULL,

    INDEX `index_promotion_redemptions_on_promotion_id`(`promotion_id`),
    INDEX `index_promotion_redemptions_on_user_id`(`user_id`),
    UNIQUE INDEX `index_promotion_redemptions_on_promotion_id_and_user_id`(`promotion_id`, `user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `promotions` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `code` VARCHAR(255) NULL,
    `valid_from` DATETIME(0) NULL,
    `valid_until` DATETIME(0) NULL,
    `description` VARCHAR(255) NULL,
    `redeem_limit` INTEGER NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,
    `affiliate_id` BIGINT NULL,

    UNIQUE INDEX `index_promotions_on_code`(`code`),
    INDEX `index_promotions_on_affiliate_id`(`affiliate_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `questions` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `label` VARCHAR(255) NULL,
    `description` VARCHAR(255) NULL,
    `accessor` VARCHAR(255) NULL,
    `input` INTEGER NULL,
    `min` FLOAT NULL,
    `max` FLOAT NULL,
    `step` FLOAT NULL,
    `prefix` VARCHAR(255) NULL,
    `suffix` VARCHAR(255) NULL,
    `placeholder` VARCHAR(255) NULL,
    `created_at` DATETIME(0) NULL,
    `updated_at` DATETIME(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `quotes` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `close` FLOAT NULL,
    `adjusted` FLOAT NULL,
    `date` DATE NULL,
    `fund_id` INTEGER NULL,
    `created_at` DATETIME(0) NULL,
    `updated_at` DATETIME(0) NULL,

    INDEX `index_quotes_on_fund_id`(`fund_id`),
    UNIQUE INDEX `index_quotes_on_date_and_fund_id`(`date`, `fund_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `raise_cash_requests` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `account_id` INTEGER NULL,
    `custodian_id` INTEGER NULL,
    `amount` DECIMAL(17, 2) NULL,
    `due_date` DATE NULL,
    `status_id` INTEGER NULL,
    `reason` VARCHAR(255) NULL,
    `source_type` VARCHAR(255) NULL,
    `source_id` INTEGER NULL,
    `created_at` DATETIME(0) NULL,
    `updated_at` DATETIME(0) NULL,

    INDEX `fk_rails_5a4a47fce6`(`account_id`),
    INDEX `fk_rails_8aaf0053ee`(`custodian_id`),
    INDEX `index_raise_cash_requests_on_source`(`source_type`, `source_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `referral_payments` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `referral_id` INTEGER NOT NULL,
    `user_id` INTEGER NULL,
    `type` VARCHAR(255) NULL,
    `amount` DECIMAL(17, 2) NULL,
    `status` VARCHAR(255) NULL,
    `paid_at` DATETIME(0) NULL,
    `paid_by_user_id` INTEGER NULL,
    `unlocked_at` DATETIME(0) NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `index_referral_payments_on_paid_by_user_id`(`paid_by_user_id`),
    INDEX `index_referral_payments_on_referral_id`(`referral_id`),
    INDEX `index_referral_payments_on_user_id`(`user_id`),
    UNIQUE INDEX `index_referral_payments_on_referral_id_and_user_id_and_type`(`referral_id`, `user_id`, `type`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `referrals` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `bonus_id` INTEGER NULL,
    `referee_email` VARCHAR(255) NULL,
    `status` VARCHAR(255) NULL,
    `last_sent_at` DATETIME(0) NULL,
    `referrer_id` INTEGER NOT NULL,
    `referee_id` INTEGER NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `index_referrals_on_referee_id`(`referee_id`),
    INDEX `index_referrals_on_referrer_id`(`referrer_id`),
    UNIQUE INDEX `index_referrals_on_referrer_id_and_referee_id`(`referrer_id`, `referee_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `reminder_notifications` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `type` VARCHAR(255) NULL,
    `sending_period_in_days` INTEGER NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    UNIQUE INDEX `index_reminder_notifications_on_type_and_sending_period_in_days`(`type`, `sending_period_in_days`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `rep_code_assignments` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `rep_code_id` BIGINT NULL,
    `advisor_id` INTEGER NULL,
    `created_at` DATETIME(6) NOT NULL,
    `updated_at` DATETIME(6) NOT NULL,

    INDEX `index_rep_code_assignments_on_advisor_id`(`advisor_id`),
    INDEX `index_rep_code_assignments_on_rep_code_id`(`rep_code_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `rep_codes` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `code` VARCHAR(255) NULL,
    `name` VARCHAR(255) NULL,
    `code_type_id` INTEGER NULL,
    `status_id` INTEGER NULL,
    `contact_type_id` INTEGER NULL,
    `branch_id` BIGINT NULL,
    `branch_manager_id` INTEGER NULL,
    `tier1_reviewer_id` INTEGER NULL,
    `branch_manager_name` VARCHAR(255) NULL,
    `email` VARCHAR(255) NULL,
    `description` VARCHAR(255) NULL,
    `created_at` DATETIME(6) NOT NULL,
    `updated_at` DATETIME(6) NOT NULL,
    `other_business` TEXT NULL,
    `other_business_type` TEXT NULL,
    `share_office` TEXT NULL,
    `termination_date` VARCHAR(255) NULL,

    INDEX `index_rep_codes_on_branch_id`(`branch_id`),
    INDEX `index_rep_codes_on_branch_manager_id`(`branch_manager_id`),
    INDEX `index_rep_codes_on_code`(`code`),
    INDEX `index_rep_codes_on_code_type_id`(`code_type_id`),
    INDEX `index_rep_codes_on_contact_type_id`(`contact_type_id`),
    INDEX `index_rep_codes_on_tier1_reviewer_id`(`tier1_reviewer_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `rif_details` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `age_to_use_id` INTEGER NULL,
    `payment_frequency_id` INTEGER NULL,
    `payment_day_of_month` INTEGER NULL,
    `start_month` INTEGER NULL,
    `start_year` INTEGER NULL,
    `payment_amount_type_id` INTEGER NULL,
    `withdrawal_amount` DECIMAL(17, 2) NULL,
    `withdrawal_amount_valid_until` DATE NULL,
    `payment_amount` DECIMAL(17, 2) NULL,
    `payment_amount_tax_id` INTEGER NULL,
    `tax_withholding_type_id` INTEGER NULL,
    `tax_withholding_percent` INTEGER NULL,
    `tax_withholding_amount` DECIMAL(17, 2) NULL,
    `account_id` INTEGER NULL,
    `pay_to_bank_account_id` INTEGER NULL,
    `pay_to_account_id` INTEGER NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `index_rif_details_on_account_id`(`account_id`),
    INDEX `index_rif_details_on_pay_to_account_id`(`pay_to_account_id`),
    INDEX `index_rif_details_on_pay_to_bank_account_id`(`pay_to_bank_account_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `risk_appetite_calculations` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `risk_appetite_type_id` INTEGER NOT NULL,
    `calculated_at` DATETIME(0) NOT NULL,
    `completed_risk_appetite_quiz_id` INTEGER NOT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `index_risk_calculations_on_completed_risk_quiz_id`(`completed_risk_appetite_quiz_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `risk_appetite_quiz_choices` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `sort_order` INTEGER NOT NULL,
    `label` VARCHAR(255) NOT NULL,
    `value` INTEGER NOT NULL,
    `risk_appetite_quiz_question_id` INTEGER NOT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `index_risk_quiz_choices_on_risk_quiz_question_id`(`risk_appetite_quiz_question_id`),
    UNIQUE INDEX `index_risk_quiz_choices_on_risk_quiz_question_and_sort_order`(`risk_appetite_quiz_question_id`, `sort_order`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `risk_appetite_quiz_questions` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `sort_order` INTEGER NOT NULL,
    `label` VARCHAR(255) NOT NULL,
    `risk_appetite_quiz_id` INTEGER NOT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `index_risk_appetite_quiz_questions_on_risk_appetite_quiz_id`(`risk_appetite_quiz_id`),
    UNIQUE INDEX `index_risk_quiz_questions_on_risk_quiz_and_sort_order`(`risk_appetite_quiz_id`, `sort_order`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `risk_appetite_quizzes` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `activated_at` DATETIME(0) NOT NULL,
    `deactivated_at` DATETIME(0) NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `schema_migrations` (
    `version` VARCHAR(255) NOT NULL,

    PRIMARY KEY (`version`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `selected_risk_appetite_quiz_choices` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `completed_risk_appetite_quiz_id` INTEGER NOT NULL,
    `risk_appetite_quiz_question_id` INTEGER NOT NULL,
    `risk_appetite_quiz_choice_id` INTEGER NOT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `index_selected_risk_quiz_choices_on_completed_risk_quiz_id`(`completed_risk_appetite_quiz_id`),
    INDEX `index_selected_risk_quiz_choices_on_risk_quiz_choice_id`(`risk_appetite_quiz_choice_id`),
    INDEX `index_selected_risk_quiz_choices_on_risk_quiz_question_id`(`risk_appetite_quiz_question_id`),
    UNIQUE INDEX `index_one_selected_choice_per_question_and_complete_risk_quiz`(`completed_risk_appetite_quiz_id`, `risk_appetite_quiz_question_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `sent_reminder_notifications` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `related_to_id` INTEGER NOT NULL,
    `related_to_type` VARCHAR(255) NOT NULL,
    `reminder_notification_id` INTEGER NOT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `index_sent_reminder_notifications_on_related_to`(`related_to_type`, `related_to_id`),
    INDEX `index_sent_reminder_notifications_on_reminder_notification_id`(`reminder_notification_id`),
    UNIQUE INDEX `index_on_reminder_notification_and_related_to`(`reminder_notification_id`, `related_to_id`, `related_to_type`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `source_investment_infos` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `institution_name` VARCHAR(255) NULL,
    `estimated_amount` INTEGER NULL,
    `source_investment` VARCHAR(255) NULL,
    `borrowed_funds` BOOLEAN NULL,
    `account_id` INTEGER NULL,
    `created_at` DATETIME(6) NOT NULL,
    `updated_at` DATETIME(6) NOT NULL,

    INDEX `index_source_investment_infos_on_account_id`(`account_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `successor_holders` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `personal_relation_id` INTEGER NOT NULL,
    `account_id` INTEGER NOT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    UNIQUE INDEX `index_successor_holders_on_account_id`(`account_id`),
    INDEX `index_successor_holders_on_personal_relation_id`(`personal_relation_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tax_statuses` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `person_id` INTEGER NOT NULL,
    `jurisdiction` VARCHAR(255) NULL,
    `tax_identification_number` VARCHAR(255) NULL,
    `reason_id` INTEGER NULL,
    `reason_text` VARCHAR(255) NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `index_tax_statuses_on_person_id`(`person_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `trade_reconciliation_mismatches` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `trade_reconciliation_report_id` INTEGER NOT NULL,
    `external_id` VARCHAR(255) NULL,
    `account_number` VARCHAR(255) NOT NULL,
    `currency` VARCHAR(255) NOT NULL,
    `side` VARCHAR(255) NOT NULL,
    `symbol` VARCHAR(255) NOT NULL,
    `market` VARCHAR(255) NOT NULL,
    `quantity` DECIMAL(17, 4) NOT NULL,
    `price` DECIMAL(17, 8) NOT NULL,
    `created_at` DATETIME(0) NULL,
    `updated_at` DATETIME(0) NULL,
    `allocation_external_id` VARCHAR(255) NULL,

    INDEX `index_trade_recon_mismatches_on_trade_recon_report_id`(`trade_reconciliation_report_id`),
    INDEX `index_trade_reconciliation_mismatches_on_external_id`(`external_id`),
    UNIQUE INDEX `index_trade_recon_mismatches_t_r_report_id_ext_id`(`trade_reconciliation_report_id`, `external_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `trade_reconciliation_reports` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `trade_date` DATE NOT NULL,
    `custodian_id` INTEGER NOT NULL,
    `allocations_file_name` VARCHAR(255) NULL,
    `no_allocations_file` BOOLEAN NOT NULL DEFAULT false,
    `created_at` DATETIME(0) NULL,
    `updated_at` DATETIME(0) NULL,

    INDEX `fk_rails_32f7dd62cb`(`custodian_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `trades` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `filled` INTEGER NULL,
    `limit_price` FLOAT NULL,
    `fund_id` INTEGER NOT NULL,
    `order_id` INTEGER NOT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,
    `type_id` INTEGER NULL DEFAULT 0,

    INDEX `index_trades_on_fund_id`(`fund_id`),
    INDEX `index_trades_on_order_id`(`order_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `trading_engine_results` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `order_id` INTEGER NULL,
    `account_id` INTEGER NULL,
    `user_id` INTEGER NULL,
    `number` VARCHAR(255) NULL,
    `client` VARCHAR(255) NULL,
    `balance` DECIMAL(10, 0) NULL,
    `withdrawals` DECIMAL(10, 0) NULL,
    `reason` VARCHAR(255) NULL,
    `duration` DECIMAL(10, 0) NULL,
    `results` TEXT NULL,
    `status` VARCHAR(255) NULL,
    `finished` BOOLEAN NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `index_trading_engine_results_on_account_id`(`account_id`),
    INDEX `index_trading_engine_results_on_order_id`(`order_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `transactions` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `account_number` VARCHAR(255) NULL,
    `transaction_code` VARCHAR(255) NULL,
    `description` VARCHAR(255) NULL,
    `cusip` VARCHAR(255) NULL,
    `trade_date` DATE NULL,
    `process_date` DATE NULL,
    `quantity` DECIMAL(17, 4) NULL,
    `amount` DECIMAL(17, 4) NULL,
    `file_date` DATE NULL,
    `unit_price` DECIMAL(17, 5) NULL,
    `external_id` VARCHAR(255) NULL,
    `original_classification_name` VARCHAR(255) NOT NULL,
    `classification_name` VARCHAR(255) NOT NULL,
    `activity_type_id` INTEGER NULL,
    `cancelled` BOOLEAN NOT NULL DEFAULT false,
    `custodian_id` INTEGER NOT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,
    `settle_date` DATE NULL,
    `raw_amount` DECIMAL(17, 4) NULL,
    `sub_classification` VARCHAR(255) NULL,
    `needs_manual_processing` BOOLEAN NOT NULL DEFAULT false,
    `allotment_id` INTEGER NULL,

    UNIQUE INDEX `transactions_external_id_idx`(`external_id`),
    INDEX `index_transactions_on_account_number`(`account_number`),
    INDEX `index_transactions_on_allotment_id`(`allotment_id`),
    INDEX `index_transactions_on_cusip`(`cusip`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `transfer_instructions` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `type_id` INTEGER NULL,
    `frequency_id` INTEGER NULL,
    `continue_until` DATE NULL,
    `max_occurrence` INTEGER NULL,
    `manual_cancel` BOOLEAN NULL,
    `amount` DECIMAL(17, 2) NULL,
    `transfer_from_id` INTEGER NOT NULL,
    `transfer_from_type` VARCHAR(255) NOT NULL,
    `transfer_to_id` INTEGER NOT NULL,
    `transfer_to_type` VARCHAR(255) NOT NULL,
    `sent_at` DATETIME(0) NULL,
    `start_date` DATE NULL,
    `cancelled` BOOLEAN NULL DEFAULT false,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,
    `cancellation_sent_at` DATETIME(0) NULL,
    `status_id` INTEGER NOT NULL,
    `cancelled_at` DATETIME(0) NULL,
    `sub_status_id` INTEGER NULL,
    `pending_for_available_cash` BOOLEAN NULL DEFAULT false,

    INDEX `index_transfer_instructions_on_transfer_from`(`transfer_from_type`, `transfer_from_id`),
    INDEX `index_transfer_instructions_on_transfer_to`(`transfer_to_type`, `transfer_to_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `transfer_requests` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `type_id` INTEGER NULL,
    `recurring` BOOLEAN NULL,
    `amount` DECIMAL(17, 2) NULL,
    `account_id` INTEGER NULL,
    `bank_account_id` INTEGER NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,
    `sent_at` DATE NULL,
    `transfer_from_id` INTEGER NULL,
    `transfer_from_type` VARCHAR(255) NULL,
    `transfer_to_id` INTEGER NULL,
    `transfer_to_type` VARCHAR(255) NULL,
    `date_to_be_processed` DATE NULL,
    `transfer_instruction_id` INTEGER NULL,
    `status_id` INTEGER NOT NULL,
    `forced_fail` BOOLEAN NOT NULL DEFAULT false,
    `forced_complete` BOOLEAN NOT NULL DEFAULT false,
    `custodian_id` INTEGER NULL,

    INDEX `index_transfer_requests_on_account_id`(`account_id`),
    INDEX `index_transfer_requests_on_bank_account_id`(`bank_account_id`),
    INDEX `index_transfer_requests_on_transfer_from`(`transfer_from_type`, `transfer_from_id`),
    INDEX `index_transfer_requests_on_transfer_instruction_id`(`transfer_instruction_id`),
    INDEX `index_transfer_requests_on_transfer_to`(`transfer_to_type`, `transfer_to_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `transfers` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `account_id` INTEGER NULL,
    `date` DATE NULL,
    `amount` DECIMAL(17, 2) NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,
    `transfer_request_id` INTEGER NULL,
    `raise_cash_request_id` INTEGER NULL,
    `external_transaction_id` VARCHAR(255) NULL,

    INDEX `fk_rails_c050efdaca`(`raise_cash_request_id`),
    INDEX `index_transfers_on_account_id`(`account_id`),
    INDEX `index_transfers_on_transfer_request_id`(`transfer_request_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `trial_model_accounts` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `model_portfolio_id` INTEGER NOT NULL,
    `account_number` VARCHAR(255) NOT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `index_trial_model_accounts_on_model_portfolio_id`(`model_portfolio_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `trial_risk_appetites` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `risk_appetite_type_id` INTEGER NOT NULL,
    `person_id` INTEGER NOT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `index_trial_risk_appetites_on_person_id`(`person_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `trial_simulation_details` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `account_id` INTEGER NOT NULL,
    `model_account_id` INTEGER NULL,
    `ratio` DECIMAL(17, 8) NULL,
    `model_account_assigned_at` DATETIME(0) NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `index_trial_simulation_details_on_account_id`(`account_id`),
    INDEX `index_trial_simulation_details_on_model_account_id`(`model_account_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `trusted_contacts` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `designated` BOOLEAN NOT NULL,
    `client_id` INTEGER NULL,
    `contact_id` INTEGER NULL,
    `relationship` VARCHAR(255) NULL,
    `email` VARCHAR(255) NULL,
    `created_at` DATETIME(6) NOT NULL,
    `updated_at` DATETIME(6) NOT NULL,

    INDEX `index_trusted_contacts_on_client_id`(`client_id`),
    INDEX `index_trusted_contacts_on_contact_id`(`contact_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `update_records` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `root_entity_id` INTEGER NULL,
    `root_entity_type` VARCHAR(255) NULL,
    `document_type` VARCHAR(255) NULL,
    `id_path` VARCHAR(255) NULL,
    `payload` TEXT NULL,
    `version` INTEGER NOT NULL DEFAULT 0,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,
    `description` VARCHAR(255) NULL,
    `result_of` VARCHAR(255) NULL,
    `previous_update_record_id` INTEGER NULL,
    `next_update_record_id` INTEGER NULL,

    INDEX `index_update_records_on_next_update_record_id`(`next_update_record_id`),
    INDEX `index_update_records_on_previous_update_record_id`(`previous_update_record_id`),
    INDEX `index_update_records_on_root_entity_type_and_root_entity_id`(`root_entity_type`, `root_entity_id`),
    UNIQUE INDEX `update_records_version_uniqueness`(`root_entity_id`, `root_entity_type`, `id_path`, `version`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `users` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(255) NOT NULL DEFAULT '',
    `encrypted_password` VARCHAR(255) NOT NULL DEFAULT '',
    `reset_password_token` VARCHAR(255) NULL,
    `reset_password_sent_at` DATETIME(0) NULL,
    `remember_created_at` DATETIME(0) NULL,
    `sign_in_count` INTEGER NOT NULL DEFAULT 0,
    `current_sign_in_at` DATETIME(0) NULL,
    `last_sign_in_at` DATETIME(0) NULL,
    `current_sign_in_ip` VARCHAR(255) NULL,
    `last_sign_in_ip` VARCHAR(255) NULL,
    `confirmation_token` VARCHAR(255) NULL,
    `confirmed_at` DATETIME(0) NULL,
    `confirmation_sent_at` DATETIME(0) NULL,
    `unconfirmed_email` VARCHAR(255) NULL,
    `failed_attempts` INTEGER NOT NULL DEFAULT 0,
    `unlock_token` VARCHAR(255) NULL,
    `locked_at` DATETIME(0) NULL,
    `income` INTEGER NULL,
    `financial_assets` INTEGER NULL,
    `non_financial_assets` INTEGER NULL,
    `total_liabilities` INTEGER NULL,
    `risk_appetite` INTEGER NULL,
    `appetite0` INTEGER NULL,
    `appetite1` INTEGER NULL,
    `appetite2` INTEGER NULL,
    `appetite3` INTEGER NULL,
    `appetite4` INTEGER NULL,
    `appetite5` INTEGER NULL,
    `appetite6` INTEGER NULL,
    `appetite7` INTEGER NULL,
    `list_email` BOOLEAN NULL,
    `is_client` BOOLEAN NULL,
    `is_super` BOOLEAN NULL,
    `id_verified` BOOLEAN NULL,
    `id_checked_at` DATETIME(0) NULL,
    `id_check_count` INTEGER NULL,
    `id_check_result` TEXT NULL,
    `is_politically_exposed_foreign_person` BOOLEAN NULL,
    `acknowledge_aadd` BOOLEAN NULL,
    `acknowledge_soag` BOOLEAN NULL,
    `acknowledge_cipfb` BOOLEAN NULL,
    `acknowledge_iirocb` BOOLEAN NULL,
    `acknowledge_rdi` BOOLEAN NULL,
    `preferred_language_id` INTEGER NULL,
    `public_company_insiders` BOOLEAN NULL,
    `public_company_owners` BOOLEAN NULL,
    `securities_industry_insiders` BOOLEAN NULL,
    `has_brokerage_accounts` BOOLEAN NULL,
    `power_of_attorney` BOOLEAN NULL,
    `power_of_attorney_first` VARCHAR(255) NULL,
    `power_of_attorney_last` VARCHAR(255) NULL,
    `created_at` DATETIME(0) NULL,
    `updated_at` DATETIME(0) NULL,
    `trial_account` BOOLEAN NULL,
    `referral_code` VARCHAR(255) NULL,
    `encrypted_otp_secret` VARCHAR(255) NULL,
    `encrypted_otp_secret_iv` VARCHAR(255) NULL,
    `encrypted_otp_secret_salt` VARCHAR(255) NULL,
    `consumed_timestep` INTEGER NULL,
    `otp_required_for_login` BOOLEAN NULL,
    `deactivated_at` DATETIME(0) NULL,
    `liquid_assets` INTEGER NULL,
    `liquid_liabilities` INTEGER NULL,
    `fixed_assets` INTEGER NULL,
    `fixed_liabilities` INTEGER NULL,
    `external_client_id` VARCHAR(255) NULL,

    UNIQUE INDEX `index_users_on_email`(`email`),
    UNIQUE INDEX `index_users_on_reset_password_token`(`reset_password_token`),
    UNIQUE INDEX `index_users_on_confirmation_token`(`confirmation_token`),
    UNIQUE INDEX `index_users_on_unlock_token`(`unlock_token`),
    UNIQUE INDEX `index_users_on_referral_code`(`referral_code`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `workflow_actions` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `action` VARCHAR(255) NULL,
    `payload` TEXT NULL,
    `timestamp` DATETIME(0) NOT NULL,
    `related_to_id` INTEGER NOT NULL,
    `related_to_type` VARCHAR(255) NOT NULL,
    `created_at` DATETIME(0) NULL,
    `updated_at` DATETIME(0) NULL,

    INDEX `index_workflow_actions_on_related_to_type_and_related_to_id`(`related_to_type`, `related_to_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `account_approval_steps` ADD CONSTRAINT `fk_rails_88ee57d397` FOREIGN KEY (`group_id`) REFERENCES `groups`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `account_approvals` ADD CONSTRAINT `fk_rails_30105757d2` FOREIGN KEY (`account_id`) REFERENCES `accounts`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `account_approvals` ADD CONSTRAINT `fk_rails_dfa181d059` FOREIGN KEY (`approver_id`) REFERENCES `users`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `account_goals` ADD CONSTRAINT `fk_rails_6e723f7853` FOREIGN KEY (`account_id`) REFERENCES `accounts`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `account_goals` ADD CONSTRAINT `fk_rails_c70ca246a1` FOREIGN KEY (`goal_id`) REFERENCES `goals`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `account_goals` ADD CONSTRAINT `fk_rails_cc44513dfd` FOREIGN KEY (`model_portfolio_id`) REFERENCES `model_portfolios`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `account_portfolio_histories` ADD CONSTRAINT `fk_rails_71ce12fec7` FOREIGN KEY (`account_id`) REFERENCES `accounts`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `account_transfer_securities` ADD CONSTRAINT `fk_rails_013d6ed05f` FOREIGN KEY (`account_transfer_id`) REFERENCES `account_transfers`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `account_transfers` ADD CONSTRAINT `fk_rails_0cdd95c514` FOREIGN KEY (`advisor_create_new_transfer_flow_id`) REFERENCES `advisor_create_new_transfer_flows`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `account_transfers` ADD CONSTRAINT `fk_rails_1880f5b55c` FOREIGN KEY (`account_id`) REFERENCES `accounts`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `account_transfers` ADD CONSTRAINT `fk_rails_6feb34774d` FOREIGN KEY (`created_by_id`) REFERENCES `people`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `accounts` ADD CONSTRAINT `fk_rails_33f2f5aec1` FOREIGN KEY (`advisor_create_new_account_flow_id`) REFERENCES `advisor_create_new_account_flows`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `accounts` ADD CONSTRAINT `fk_rails_4803c53170` FOREIGN KEY (`group_savings_plan_id`) REFERENCES `group_savings_plans`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `accounts` ADD CONSTRAINT `fk_rails_b1e30bebc8` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `accounts` ADD CONSTRAINT `fk_rails_cc6e7d1972` FOREIGN KEY (`bank_account_id`) REFERENCES `bank_accounts`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `activities` ADD CONSTRAINT `fk_rails_7e11bb717f` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `activities` ADD CONSTRAINT `fk_rails_e53101708c` FOREIGN KEY (`account_id`) REFERENCES `accounts`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `advisor_assignments` ADD CONSTRAINT `fk_rails_5bfacf7c7a` FOREIGN KEY (`advisor_id`) REFERENCES `people`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `advisor_assignments` ADD CONSTRAINT `fk_rails_6d3d1e4fcb` FOREIGN KEY (`rep_code_id`) REFERENCES `rep_codes`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `advisor_assignments` ADD CONSTRAINT `fk_rails_d1d27e364c` FOREIGN KEY (`client_advisor_assignment_id`) REFERENCES `client_advisor_assignments`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `advisor_beneficiary_forms` ADD CONSTRAINT `fk_rails_224a0d6b63` FOREIGN KEY (`primary_caregiver_id`) REFERENCES `people`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `advisor_beneficiary_forms` ADD CONSTRAINT `fk_rails_9d9f1d9946` FOREIGN KEY (`legal_guardian_id`) REFERENCES `people`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `advisor_beneficiary_forms` ADD CONSTRAINT `fk_rails_c50d78a0ab` FOREIGN KEY (`advisor_create_new_account_flow_id`) REFERENCES `advisor_create_new_account_flows`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `advisor_beneficiary_forms` ADD CONSTRAINT `fk_rails_f425f85686` FOREIGN KEY (`personal_relation_id`) REFERENCES `personal_relations`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `advisor_create_new_account_flows` ADD CONSTRAINT `fk_rails_1278c27d8a` FOREIGN KEY (`advisor_id`) REFERENCES `people`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `advisor_create_new_account_flows` ADD CONSTRAINT `fk_rails_dffd8d060d` FOREIGN KEY (`client_id`) REFERENCES `people`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `advisor_create_new_client_flows` ADD CONSTRAINT `fk_rails_5009430975` FOREIGN KEY (`advisor_id`) REFERENCES `people`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `advisor_create_new_client_flows` ADD CONSTRAINT `fk_rails_55cae3b731` FOREIGN KEY (`client_id`) REFERENCES `people`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `advisor_create_new_transfer_flows` ADD CONSTRAINT `fk_rails_32170d6455` FOREIGN KEY (`client_id`) REFERENCES `people`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `advisor_create_new_transfer_flows` ADD CONSTRAINT `fk_rails_34004d5365` FOREIGN KEY (`advisor_id`) REFERENCES `people`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `advisor_create_new_transfer_flows` ADD CONSTRAINT `fk_rails_45cd0f5de4` FOREIGN KEY (`advisor_create_new_client_flow_id`) REFERENCES `advisor_create_new_client_flows`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `advisor_create_new_transfer_flows` ADD CONSTRAINT `fk_rails_8dbdb47110` FOREIGN KEY (`account_flow_id`) REFERENCES `advisor_create_new_account_flows`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `advisor_create_new_transfer_instruction_flows` ADD CONSTRAINT `fk_rails_00d38460d6` FOREIGN KEY (`client_id`) REFERENCES `people`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `advisor_create_new_transfer_instruction_flows` ADD CONSTRAINT `fk_rails_02fe1ef5ce` FOREIGN KEY (`advisor_create_new_client_flow_id`) REFERENCES `advisor_create_new_client_flows`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `advisor_create_new_transfer_instruction_flows` ADD CONSTRAINT `fk_rails_f7f742a62d` FOREIGN KEY (`advisor_id`) REFERENCES `people`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `advisor_create_new_transfer_securities` ADD CONSTRAINT `fk_rails_8238e32af5` FOREIGN KEY (`advisor_create_new_transfer_flow_id`) REFERENCES `advisor_create_new_transfer_flows`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `advisor_notification_subscriptions` ADD CONSTRAINT `fk_rails_2561aed093` FOREIGN KEY (`advisor_id`) REFERENCES `people`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `allotments` ADD CONSTRAINT `fk_rails_35822e30aa` FOREIGN KEY (`fund_id`) REFERENCES `funds`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `allotments` ADD CONSTRAINT `fk_rails_881e48b645` FOREIGN KEY (`account_id`) REFERENCES `accounts`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `allotments` ADD CONSTRAINT `fk_rails_b65c19f8e3` FOREIGN KEY (`position_id`) REFERENCES `positions`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `allotments` ADD CONSTRAINT `fk_rails_bfdbadb058` FOREIGN KEY (`trade_id`) REFERENCES `trades`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `alternative_funds` ADD CONSTRAINT `fk_rails_20ae9c86c0` FOREIGN KEY (`allocation_id`) REFERENCES `allocations`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `alternative_funds` ADD CONSTRAINT `fk_rails_e1407a964e` FOREIGN KEY (`fund_id`) REFERENCES `funds`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `application_read_models` ADD CONSTRAINT `fk_rails_1893af1a21` FOREIGN KEY (`advisor_create_new_account_flow_id`) REFERENCES `advisor_create_new_account_flows`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `application_read_models` ADD CONSTRAINT `fk_rails_3e22303528` FOREIGN KEY (`account_id`) REFERENCES `accounts`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `application_read_models` ADD CONSTRAINT `fk_rails_64c209d9c9` FOREIGN KEY (`advisor_create_new_client_flow_id`) REFERENCES `advisor_create_new_client_flows`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `application_read_models` ADD CONSTRAINT `fk_rails_772abd3521` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `assets_under_management_histories` ADD CONSTRAINT `fk_rails_ba1832f916` FOREIGN KEY (`group_id`) REFERENCES `groups`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `balances` ADD CONSTRAINT `fk_rails_9452e1f8fd` FOREIGN KEY (`account_id`) REFERENCES `accounts`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `bank_accounts` ADD CONSTRAINT `fk_rails_92daa8a387` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `beneficiaries` ADD CONSTRAINT `fk_rails_301a671b2c` FOREIGN KEY (`primary_caregiver_id`) REFERENCES `people`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `beneficiaries` ADD CONSTRAINT `fk_rails_4e8294fa10` FOREIGN KEY (`personal_relation_id`) REFERENCES `personal_relations`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `beneficiaries` ADD CONSTRAINT `fk_rails_8e784869b5` FOREIGN KEY (`legal_guardian_id`) REFERENCES `people`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `beneficiaries` ADD CONSTRAINT `fk_rails_927918f722` FOREIGN KEY (`account_id`) REFERENCES `accounts`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `beneficiaries` ADD CONSTRAINT `fk_rails_e4c95811d8` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `brokerage_accounts` ADD CONSTRAINT `fk_rails_13a1668c92` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `charges` ADD CONSTRAINT `fk_rails_7422c2ed13` FOREIGN KEY (`account_id`) REFERENCES `accounts`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `client_advisor_assignment_flows` ADD CONSTRAINT `fk_rails_5f4bf85f97` FOREIGN KEY (`ima_doc_id`) REFERENCES `documents`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `client_advisor_assignment_flows` ADD CONSTRAINT `fk_rails_8bbc93fa8b` FOREIGN KEY (`group_id`) REFERENCES `groups`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `client_advisor_assignment_flows` ADD CONSTRAINT `fk_rails_903c763c4a` FOREIGN KEY (`client_id`) REFERENCES `users`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `client_advisor_assignments` ADD CONSTRAINT `fk_rails_940fee5a73` FOREIGN KEY (`client_id`) REFERENCES `people`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `client_read_models` ADD CONSTRAINT `fk_rails_c0ed1c793d` FOREIGN KEY (`person_id`) REFERENCES `people`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `completed_risk_appetite_quizzes` ADD CONSTRAINT `fk_rails_1082e01f4d` FOREIGN KEY (`person_id`) REFERENCES `people`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `completed_risk_appetite_quizzes` ADD CONSTRAINT `fk_rails_d3b4e6db9f` FOREIGN KEY (`risk_appetite_quiz_id`) REFERENCES `risk_appetite_quizzes`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `contribution_amounts` ADD CONSTRAINT `fk_rails_139e9011c3` FOREIGN KEY (`account_id`) REFERENCES `accounts`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `dataphile_records` ADD CONSTRAINT `fk_rails_117c8aca1a` FOREIGN KEY (`account_id`) REFERENCES `accounts`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `dependencies` ADD CONSTRAINT `fk_rails_d7ffce842a` FOREIGN KEY (`question_id`) REFERENCES `questions`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `document_processing_results` ADD CONSTRAINT `fk_rails_c3ff017f03` FOREIGN KEY (`document_id`) REFERENCES `documents`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `documents` ADD CONSTRAINT `fk_rails_2be0318c46` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `external_advisor_services` ADD CONSTRAINT `fk_rails_4aa01446c6` FOREIGN KEY (`group_id`) REFERENCES `groups`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `external_identity_checks` ADD CONSTRAINT `fk_rails_018e3abc36` FOREIGN KEY (`person_id`) REFERENCES `people`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `fee_credit_accounts` ADD CONSTRAINT `fk_rails_d9631f050b` FOREIGN KEY (`person_id`) REFERENCES `people`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `fee_credit_transactions` ADD CONSTRAINT `fk_rails_51df9d9508` FOREIGN KEY (`added_by_id`) REFERENCES `users`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `fee_credit_transactions` ADD CONSTRAINT `fk_rails_fdf586e793` FOREIGN KEY (`fee_credit_account_id`) REFERENCES `fee_credit_accounts`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `fee_schedule_assignments` ADD CONSTRAINT `fk_rails_6938abcec5` FOREIGN KEY (`fee_schedule_id`) REFERENCES `fee_schedules`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `fee_schedule_assignments` ADD CONSTRAINT `fk_rails_e6d442b880` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `fee_tiers` ADD CONSTRAINT `fk_rails_7ec5482f69` FOREIGN KEY (`fee_schedule_id`) REFERENCES `fee_schedules`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `fund_accounts` ADD CONSTRAINT `fk_rails_07c818f6a9` FOREIGN KEY (`fund_id`) REFERENCES `funds`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `fund_accounts` ADD CONSTRAINT `fk_rails_a2c01a6ffd` FOREIGN KEY (`account_id`) REFERENCES `accounts`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `group_savings_plans` ADD CONSTRAINT `fk_rails_d28e68f5b2` FOREIGN KEY (`company_id`) REFERENCES `companies`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `group_savings_plans` ADD CONSTRAINT `fk_rails_dfdc64feea` FOREIGN KEY (`group_id`) REFERENCES `groups`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `groups` ADD CONSTRAINT `fk_rails_d81b249d13` FOREIGN KEY (`fee_schedule_id`) REFERENCES `fee_schedules`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `groups` ADD CONSTRAINT `groups_parent_id_foreign_key` FOREIGN KEY (`parent_id`) REFERENCES `groups`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `household_invitations` ADD CONSTRAINT `fk_rails_335a938e21` FOREIGN KEY (`person_id`) REFERENCES `people`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `household_invitations` ADD CONSTRAINT `fk_rails_dcc0aec101` FOREIGN KEY (`household_id`) REFERENCES `households`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `household_memberships` ADD CONSTRAINT `fk_rails_83f9a515c3` FOREIGN KEY (`person_id`) REFERENCES `people`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `household_memberships` ADD CONSTRAINT `fk_rails_f11dbb5a09` FOREIGN KEY (`household_id`) REFERENCES `households`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `insider_roles` ADD CONSTRAINT `fk_rails_26aa9d1806` FOREIGN KEY (`person_id`) REFERENCES `people`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `investment_management_agreements` ADD CONSTRAINT `fk_rails_e1a55d8ef3` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `investment_policy_statements` ADD CONSTRAINT `fk_rails_7b9abee8c2` FOREIGN KEY (`account_id`) REFERENCES `accounts`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `issue_comments` ADD CONSTRAINT `fk_rails_132c66f500` FOREIGN KEY (`created_by_id`) REFERENCES `users`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `issue_comments` ADD CONSTRAINT `fk_rails_265539db40` FOREIGN KEY (`issue_id`) REFERENCES `issues`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `issues` ADD CONSTRAINT `fk_rails_181d01bbf3` FOREIGN KEY (`created_by_id`) REFERENCES `users`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `issues` ADD CONSTRAINT `fk_rails_a1f8aadbc6` FOREIGN KEY (`assigned_to_id`) REFERENCES `users`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `joint_applicants` ADD CONSTRAINT `fk_rails_09a49197a3` FOREIGN KEY (`account_id`) REFERENCES `accounts`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `joint_applicants` ADD CONSTRAINT `fk_rails_9da4815718` FOREIGN KEY (`person_id`) REFERENCES `people`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `know_your_clients` ADD CONSTRAINT `fk_rails_cad706c2ec` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `kyc_updates` ADD CONSTRAINT `fk_rails_f198ad1591` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `legal_infos` ADD CONSTRAINT `fk_rails_59ec4d0b0c` FOREIGN KEY (`person_id`) REFERENCES `people`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `legal_residencies` ADD CONSTRAINT `fk_rails_aa39074dcc` FOREIGN KEY (`person_id`) REFERENCES `people`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `manual_identity_checks` ADD CONSTRAINT `fk_rails_892b039bb5` FOREIGN KEY (`person_id`) REFERENCES `people`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `manual_identity_checks` ADD CONSTRAINT `fk_rails_c46e250b01` FOREIGN KEY (`inspector_id`) REFERENCES `people`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `notes` ADD CONSTRAINT `fk_rails_27aea6a7e9` FOREIGN KEY (`person_id`) REFERENCES `people`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `notes` ADD CONSTRAINT `fk_rails_ed57cedfc1` FOREIGN KEY (`account_id`) REFERENCES `accounts`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `notifications` ADD CONSTRAINT `fk_rails_b080fb4855` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `one_time_passwords` ADD CONSTRAINT `fk_rails_95b3fb06d4` FOREIGN KEY (`sent_by_id`) REFERENCES `users`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `one_time_passwords` ADD CONSTRAINT `fk_rails_afd10ae0cb` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `participants` ADD CONSTRAINT `fk_rails_673abba6bd` FOREIGN KEY (`person_id`) REFERENCES `people`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `participants` ADD CONSTRAINT `fk_rails_fc5ec3430a` FOREIGN KEY (`account_id`) REFERENCES `accounts`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `people` ADD CONSTRAINT `fk_rails_b39dcee1e8` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `performance_summaries` ADD CONSTRAINT `fk_rails_44b97c7988` FOREIGN KEY (`account_id`) REFERENCES `accounts`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `personal_relations` ADD CONSTRAINT `fk_rails_4dd760e207` FOREIGN KEY (`person_id`) REFERENCES `people`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `personal_relations` ADD CONSTRAINT `fk_rails_9adecfc357` FOREIGN KEY (`relative_id`) REFERENCES `people`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `phone_numbers` ADD CONSTRAINT `fk_rails_0d1ef54944` FOREIGN KEY (`same_as_id`) REFERENCES `phone_numbers`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `portfolio_tactical_allocation_targets` ADD CONSTRAINT `fk_rails_1fd79887c9` FOREIGN KEY (`allocation_id`) REFERENCES `allocations`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `portfolio_tactical_allocation_targets` ADD CONSTRAINT `fk_rails_268f8f8ed1` FOREIGN KEY (`portfolio_tactical_target_id`) REFERENCES `portfolio_tactical_targets`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `portfolio_tactical_targets` ADD CONSTRAINT `fk_rails_e7babea7a9` FOREIGN KEY (`model_portfolio_id`) REFERENCES `model_portfolios`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `positions` ADD CONSTRAINT `fk_rails_4ccd9a0798` FOREIGN KEY (`account_id`) REFERENCES `accounts`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `positions` ADD CONSTRAINT `fk_rails_b22d16aff5` FOREIGN KEY (`fund_id`) REFERENCES `funds`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `preferred_custodians` ADD CONSTRAINT `fk_rails_14890218bd` FOREIGN KEY (`person_id`) REFERENCES `people`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `preferred_custodians` ADD CONSTRAINT `fk_rails_eb6da000b6` FOREIGN KEY (`custodian_id`) REFERENCES `custodians`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `profiles` ADD CONSTRAINT `fk_rails_c67ac8f59c` FOREIGN KEY (`promotion_id`) REFERENCES `promotions`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `profiles` ADD CONSTRAINT `fk_rails_e424190865` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `promotion_details` ADD CONSTRAINT `fk_rails_eeddcd5111` FOREIGN KEY (`promotion_id`) REFERENCES `promotions`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `promotion_redemptions` ADD CONSTRAINT `fk_rails_02d656b69c` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `promotion_redemptions` ADD CONSTRAINT `fk_rails_169022a634` FOREIGN KEY (`promotion_id`) REFERENCES `promotions`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `promotions` ADD CONSTRAINT `fk_rails_53c0626868` FOREIGN KEY (`affiliate_id`) REFERENCES `affiliates`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `raise_cash_requests` ADD CONSTRAINT `fk_rails_5a4a47fce6` FOREIGN KEY (`account_id`) REFERENCES `accounts`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `raise_cash_requests` ADD CONSTRAINT `fk_rails_8aaf0053ee` FOREIGN KEY (`custodian_id`) REFERENCES `custodians`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `referral_payments` ADD CONSTRAINT `fk_rails_24faaaf1be` FOREIGN KEY (`referral_id`) REFERENCES `referrals`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `referral_payments` ADD CONSTRAINT `fk_rails_c07c3a2f65` FOREIGN KEY (`paid_by_user_id`) REFERENCES `users`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `referral_payments` ADD CONSTRAINT `fk_rails_e556238d04` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `referrals` ADD CONSTRAINT `fk_rails_2eb0614166` FOREIGN KEY (`referrer_id`) REFERENCES `users`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `referrals` ADD CONSTRAINT `fk_rails_3b55e485b8` FOREIGN KEY (`referee_id`) REFERENCES `users`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `rep_code_assignments` ADD CONSTRAINT `fk_rails_4305ee108c` FOREIGN KEY (`advisor_id`) REFERENCES `users`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `rep_code_assignments` ADD CONSTRAINT `fk_rails_e0ddf46002` FOREIGN KEY (`rep_code_id`) REFERENCES `rep_codes`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `rep_codes` ADD CONSTRAINT `fk_rails_2124404dd8` FOREIGN KEY (`branch_id`) REFERENCES `branches`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `rep_codes` ADD CONSTRAINT `fk_rails_436acad198` FOREIGN KEY (`branch_manager_id`) REFERENCES `users`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `rep_codes` ADD CONSTRAINT `fk_rails_447a6552ea` FOREIGN KEY (`tier1_reviewer_id`) REFERENCES `users`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `rif_details` ADD CONSTRAINT `fk_rails_11836e7a32` FOREIGN KEY (`pay_to_bank_account_id`) REFERENCES `bank_accounts`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `rif_details` ADD CONSTRAINT `fk_rails_13bf25b004` FOREIGN KEY (`pay_to_account_id`) REFERENCES `accounts`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `rif_details` ADD CONSTRAINT `fk_rails_1f561cc352` FOREIGN KEY (`account_id`) REFERENCES `accounts`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `risk_appetite_calculations` ADD CONSTRAINT `fk_rails_447d4e3776` FOREIGN KEY (`completed_risk_appetite_quiz_id`) REFERENCES `completed_risk_appetite_quizzes`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `risk_appetite_quiz_choices` ADD CONSTRAINT `fk_rails_44768a6ef4` FOREIGN KEY (`risk_appetite_quiz_question_id`) REFERENCES `risk_appetite_quiz_questions`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `risk_appetite_quiz_questions` ADD CONSTRAINT `fk_rails_8506382183` FOREIGN KEY (`risk_appetite_quiz_id`) REFERENCES `risk_appetite_quizzes`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `selected_risk_appetite_quiz_choices` ADD CONSTRAINT `fk_rails_33e4b75a28` FOREIGN KEY (`risk_appetite_quiz_question_id`) REFERENCES `risk_appetite_quiz_questions`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `selected_risk_appetite_quiz_choices` ADD CONSTRAINT `fk_rails_4948ab9688` FOREIGN KEY (`risk_appetite_quiz_choice_id`) REFERENCES `risk_appetite_quiz_choices`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `selected_risk_appetite_quiz_choices` ADD CONSTRAINT `fk_rails_8305aacfd2` FOREIGN KEY (`completed_risk_appetite_quiz_id`) REFERENCES `completed_risk_appetite_quizzes`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `sent_reminder_notifications` ADD CONSTRAINT `fk_rails_95a959b8d9` FOREIGN KEY (`reminder_notification_id`) REFERENCES `reminder_notifications`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `source_investment_infos` ADD CONSTRAINT `fk_rails_d7a111f1c0` FOREIGN KEY (`account_id`) REFERENCES `accounts`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `successor_holders` ADD CONSTRAINT `fk_rails_0d6ccd1579` FOREIGN KEY (`account_id`) REFERENCES `accounts`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `successor_holders` ADD CONSTRAINT `fk_rails_18e0c5ed5e` FOREIGN KEY (`personal_relation_id`) REFERENCES `personal_relations`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `tax_statuses` ADD CONSTRAINT `fk_rails_7aa23e6e4a` FOREIGN KEY (`person_id`) REFERENCES `people`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `trade_reconciliation_mismatches` ADD CONSTRAINT `fk_rails_402d525f61` FOREIGN KEY (`trade_reconciliation_report_id`) REFERENCES `trade_reconciliation_reports`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `trade_reconciliation_reports` ADD CONSTRAINT `fk_rails_32f7dd62cb` FOREIGN KEY (`custodian_id`) REFERENCES `custodians`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `trades` ADD CONSTRAINT `fk_rails_7d14776990` FOREIGN KEY (`order_id`) REFERENCES `orders`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `trades` ADD CONSTRAINT `fk_rails_ec99ec61a4` FOREIGN KEY (`fund_id`) REFERENCES `funds`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `trading_engine_results` ADD CONSTRAINT `fk_rails_1bb789d3ac` FOREIGN KEY (`order_id`) REFERENCES `orders`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `trading_engine_results` ADD CONSTRAINT `fk_rails_71a3c1b582` FOREIGN KEY (`account_id`) REFERENCES `accounts`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `transfer_requests` ADD CONSTRAINT `fk_rails_27a41b258c` FOREIGN KEY (`account_id`) REFERENCES `accounts`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `transfer_requests` ADD CONSTRAINT `fk_rails_7b3d9868e0` FOREIGN KEY (`transfer_instruction_id`) REFERENCES `transfer_instructions`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `transfer_requests` ADD CONSTRAINT `fk_rails_f4f5bea454` FOREIGN KEY (`bank_account_id`) REFERENCES `bank_accounts`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `transfers` ADD CONSTRAINT `fk_rails_c050efdaca` FOREIGN KEY (`raise_cash_request_id`) REFERENCES `raise_cash_requests`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `transfers` ADD CONSTRAINT `fk_rails_e33bbc3d7d` FOREIGN KEY (`account_id`) REFERENCES `accounts`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `transfers` ADD CONSTRAINT `fk_rails_ea47d8d108` FOREIGN KEY (`transfer_request_id`) REFERENCES `transfer_requests`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `trial_model_accounts` ADD CONSTRAINT `fk_rails_5c050324c6` FOREIGN KEY (`model_portfolio_id`) REFERENCES `model_portfolios`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `trial_risk_appetites` ADD CONSTRAINT `fk_rails_f08ef00cf0` FOREIGN KEY (`person_id`) REFERENCES `people`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `trial_simulation_details` ADD CONSTRAINT `fk_rails_5b376f666b` FOREIGN KEY (`model_account_id`) REFERENCES `trial_model_accounts`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `trial_simulation_details` ADD CONSTRAINT `fk_rails_91042d28dd` FOREIGN KEY (`account_id`) REFERENCES `accounts`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `trusted_contacts` ADD CONSTRAINT `fk_rails_b3d0a26068` FOREIGN KEY (`contact_id`) REFERENCES `people`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `trusted_contacts` ADD CONSTRAINT `fk_rails_d7c88948be` FOREIGN KEY (`client_id`) REFERENCES `people`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

