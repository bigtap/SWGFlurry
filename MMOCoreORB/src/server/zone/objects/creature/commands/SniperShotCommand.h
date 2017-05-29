/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef SNIPERSHOTCOMMAND_H_
#define SNIPERSHOTCOMMAND_H_

#include "server/zone/objects/scene/SceneObject.h"
#include "CombatQueueCommand.h"
#include "server/zone/objects/player/sui/SuiCallback.h"
#include "server/zone/managers/visibility/VisibilityManager.h"
#include "server/zone/objects/player/sui/callbacks/BountyHuntSuiCallback.h"
#include "server/zone/objects/player/sui/inputbox/SuiInputBox.h"

class SniperShotCommand : public CombatQueueCommand {
public:

	SniperShotCommand(const String& name, ZoneProcessServer* server)
		: CombatQueueCommand(name, server) {
	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {

		if (!checkStateMask(creature))
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(creature))
			return INVALIDLOCOMOTION;

		if (!creature->isKneeling() ) {
							creature->sendSystemMessage("You Must Be Kneeling Inorder To Use Sniper Shot");
   	 return GENERALERROR;
	 }

		ManagedReference<SceneObject*> targetObject = creature->getZoneServer()->getObject(target);

		CreatureObject* targetCreature = cast<CreatureObject*>(targetObject.get());

		if (targetCreature == NULL)
			return INVALIDTARGET;

		if (!targetCreature->isAttackableBy(creature))
			return INVALIDTARGET;

		CreatureObject* player = cast<CreatureObject*>(creature);

		if (!creature->checkCooldownRecovery("sniper_shot")) {
   			StringIdChatParameter stringId;

   			Time* cdTime = creature->getCooldownTime("sniper_shot");

   			int timeLeft = floor((float)cdTime->miliDifference() / 1000) *-1;

   			stringId.setStringId("@innate:equil_wait"); // You are still recovering from your last Command available in %DI seconds.
   			stringId.setDI(timeLeft);
   			creature->sendSystemMessage(stringId);
   			        return GENERALERROR;
   		       }

 		player->addCooldown("sniper_shot", 10 * 1000); // 10 second cooldown
		player->playEffect("clienteffect/lair_med_damage_smoke.cef");

		int res = doCombatAction(creature, target);
		int chance = 50;
		int headshot = 25;

		CombatManager* combatManager = CombatManager::instance();
		if (res == SUCCESS && System::random(100) > chance) {
			Locker clocker(targetCreature, creature);

			targetCreature->playEffect("clienteffect/combat_special_attacker_aim.cef", "head");
      targetCreature->setPosture(CreaturePosture::KNOCKEDDOWN);

			if (creature->isPlayerCreature())
				creature->sendSystemMessage("Attack has successfully landed");

		} else {

			if (creature->isPlayerCreature())
				creature->sendSystemMessage("Attack has failed to land");
		}

		if (res == SUCCESS && System::random(100) < headshot) {
			Locker clocker(targetCreature, creature);

			targetCreature->playEffect("clienteffect/combat_special_attacker_aim.cef", "head");
			targetCreature->addState(CreatureState::DIZZY);
			targetCreature->addState(CreatureState::STUNNED);

			if (creature->isPlayerCreature())

		} else {

			if (creature->isPlayerCreature())
				creature->sendSystemMessage("Dizzy Knockdown Attempt Has Failed To Land");
		}

		if (res == SUCCESS && System::random(100) < headshot) {
			Locker clocker(targetCreature, creature);

			targetCreature->playEffect("clienteffect/combat_special_attacker_aim.cef", "head");
			targetCreature->addState(CreatureState::DIZZY);
			targetCreature->addState(CreatureState::STUNNED);

			if (creature->isPlayerCreature())

		} else {

			if (creature->isPlayerCreature())
				creature->sendSystemMessage("Dizzy Knockdown Attempt Has Failed To Land");
		}

		return res;
	}

};

#endif //SNIPERSHOTCOMMAND_H_
