/*
    Copyright 2020 SPAD squad, based on the works of the Empty Set Squad

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
*/

pragma solidity ^0.5.17;
pragma experimental ABIEncoderV2;

import "./external/Decimal.sol";

library Constants {
    /* Chain */
    uint256 private constant CHAIN_ID = 1; // MAINNET 

    /* Bootstrapping */
    uint256 private constant BOOTSTRAPPING_PERIOD = 60; // 60 epochs
    uint256 private constant BOOTSTRAPPING_PRICE = 11e17; // 1.10 USDC
    uint256 private constant BOOTSTRAPPING_SUPPLY_CHANGE_LIMIT = 10e16; // 10%

    /* Oracle */
    address private constant USDC = address(0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48);
    uint256 private constant ORACLE_RESERVE_MINIMUM = 1e9; // 1000 USDC

    /* Bonding */
    uint256 private constant INITIAL_STAKE_MULTIPLE = 1e6; // 100 SPAD -> 100M SPAD-S

    /* Epoch */
    struct EpochStrategy {
        uint256 offset;
        uint256 start;
        uint256 period;
    }

    uint256 private constant EPOCH_OFFSET = 0;
    uint256 private constant EPOCH_START = 1609405200;
    uint256 private constant EPOCH_PERIOD = 14400; // 4 hrs

    /* Governance */
    uint256 private constant GOVERNANCE_PERIOD = 6; // 6 epochs
    uint256 private constant GOVERNANCE_EXPIRATION = 4; // 4 + 1 epochs
    uint256 private constant GOVERNANCE_QUORUM = 20e16; // 20%
    uint256 private constant GOVERNANCE_PROPOSAL_THRESHOLD = 5e15; // 0.5%
    uint256 private constant GOVERNANCE_SUPER_MAJORITY = 66e16; // 66%
    uint256 private constant GOVERNANCE_EMERGENCY_DELAY = 4; // 4 epochs

    /* DAO */
    uint256 private constant ADVANCE_INCENTIVE = 100e18; // 100 SPAD
    uint256 private constant DAO_EXIT_LOCKUP_EPOCHS = 30; // 30 epochs

    /* Pool */
    uint256 private constant POOL_EXIT_LOCKUP_EPOCHS = 10; // 10 epochs

    /* Market */
    uint256 private constant COUPON_EXPIRATION = 180;
    uint256 private constant DEBT_RATIO_CAP = 15e16; // 15%

    /* Regulator */
    uint256 private constant SUPPLY_CHANGE_LIMIT = 3e16; // 3%
    uint256 private constant COUPON_SUPPLY_CHANGE_LIMIT = 6e16; // 6%
    uint256 private constant ORACLE_POOL_RATIO = 5550; // 55.5%
    uint256 private constant TREASURY_RATIO = 450; // 4.5%

    /* Address */
    address private constant TREASURY_ADDRESS = address(0xBe8F6aa69e85b7d21B3C2cFdC48E2376e68d1AFE);

    /**
     * Getters
     */
    function getUsdcAddress() internal pure returns (address) {
        return USDC;
    }

    function getOracleReserveMinimum() internal pure returns (uint256) {
        return ORACLE_RESERVE_MINIMUM;
    }

    function getEpochStrategy() internal pure returns (EpochStrategy memory) {
        return EpochStrategy({
            offset: EPOCH_OFFSET,
            start: EPOCH_START,
            period: EPOCH_PERIOD
        });
    }

    function getInitialStakeMultiple() internal pure returns (uint256) {
        return INITIAL_STAKE_MULTIPLE;
    }

    function getBootstrappingPeriod() internal pure returns (uint256) {
        return BOOTSTRAPPING_PERIOD;
    }

    function getBootstrappingPrice() internal pure returns (Decimal.D256 memory) {
        return Decimal.D256({value: BOOTSTRAPPING_PRICE});
    }
    
    function getBootstrappingSupplyChangeLimit() internal pure returns (Decimal.D256 memory) {
        return Decimal.D256({value: BOOTSTRAPPING_SUPPLY_CHANGE_LIMIT});
    }

    function getGovernancePeriod() internal pure returns (uint256) {
        return GOVERNANCE_PERIOD;
    }

    function getGovernanceExpiration() internal pure returns (uint256) {
        return GOVERNANCE_EXPIRATION;
    }

    function getGovernanceQuorum() internal pure returns (Decimal.D256 memory) {
        return Decimal.D256({value: GOVERNANCE_QUORUM});
    }

    function getGovernanceProposalThreshold() internal pure returns (Decimal.D256 memory) {
        return Decimal.D256({value: GOVERNANCE_PROPOSAL_THRESHOLD});
    }

    function getGovernanceSuperMajority() internal pure returns (Decimal.D256 memory) {
        return Decimal.D256({value: GOVERNANCE_SUPER_MAJORITY});
    }

    function getGovernanceEmergencyDelay() internal pure returns (uint256) {
        return GOVERNANCE_EMERGENCY_DELAY;
    }

    function getAdvanceIncentive() internal pure returns (uint256) {
        return ADVANCE_INCENTIVE;
    }

    function getDAOExitLockupEpochs() internal pure returns (uint256) {
        return DAO_EXIT_LOCKUP_EPOCHS;
    }

    function getPoolExitLockupEpochs() internal pure returns (uint256) {
        return POOL_EXIT_LOCKUP_EPOCHS;
    }

    function getCouponExpiration() internal pure returns (uint256) {
        return COUPON_EXPIRATION;
    }

    function getTreasuryRatio() internal pure returns (uint256) {
        return TREASURY_RATIO;
    }

    function getCouponSupplyChangeLimit() internal pure returns (Decimal.D256 memory) {
        return Decimal.D256({value: COUPON_SUPPLY_CHANGE_LIMIT});
    }

    function getDebtRatioCap() internal pure returns (Decimal.D256 memory) {
        return Decimal.D256({value: DEBT_RATIO_CAP});
    }

    function getSupplyChangeLimit() internal pure returns (Decimal.D256 memory) {
        return Decimal.D256({value: SUPPLY_CHANGE_LIMIT});
    }

    function getOraclePoolRatio() internal pure returns (uint256) {
        return ORACLE_POOL_RATIO;
    }

    function getChainId() internal pure returns (uint256) {
        return CHAIN_ID;
    }

    function getTreasuryAddress() internal pure returns (address) {
        return TREASURY_ADDRESS;
    }
}
