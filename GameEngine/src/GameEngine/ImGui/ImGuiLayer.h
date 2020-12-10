#pragma once

#include "GameEngine/Layer.h"
#include "GameEngine/Events/KeyEvent.h"
#include "GameEngine/Events/MouseEvent.h"
#include "GameEngine/Events/ApplicationEvent.h"

namespace GameEngine
{
	class GE_API ImGuiLayer : public Layer
	{
	public :
		ImGuiLayer();
		~ImGuiLayer();

		virtual void OnDetach() override;
		virtual void OnAttach() override;
		virtual void OnImGuiRender() override;

		void Begin();
		void End();
	
	private:

		float m_Time = 0.0f;
	};
}