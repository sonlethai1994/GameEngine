#pragma once

#include "GameEngine/Layer.h"

namespace GameEngine
{
	class GE_API ImGuiLayer : public Layer
	{
	public :
		ImGuiLayer();
		~ImGuiLayer();

		void OnDetach();
		void OnAttach();
		void OnUpdate();
		void OnEvent(Event& event);
	private:
		float m_Time = 0.0f;
	};
}